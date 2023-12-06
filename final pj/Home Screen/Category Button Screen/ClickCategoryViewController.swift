//
//  ClickCategoryViewController.swift
//  final pj
//
//  Created by 郭 on 2023/12/4.
//

import UIKit
import FirebaseFirestore


class ClickCategoryViewController: UIViewController {
    
    let categoryScreen = ClickCategoryView()
    
    let database = Firestore.firestore()
    
    var filterList = [product]()
    
    var categoryName: String?
    
//    var handleAuth: AuthStateDidChangeListenerHandle?
//
//    var currentUser:FirebaseAuth.User?
    
    var uid: String?

    override func loadView() {
        view = categoryScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        categoryScreen.tableViewProductLists.delegate = self
        categoryScreen.tableViewProductLists.dataSource = self
        
        categoryScreen.tableViewProductLists.separatorStyle = .none
        
        getProducts()
    }
    
    func getProducts(){
            let refDoc = self.database.collection("users")
            refDoc.getDocuments{ (userSnapshot, error) in
                if let error = error {
                    print("Error getting documents: \(error)")
                } else {
                    if let userSnapshot = userSnapshot {
                        for userDocument in userSnapshot.documents {
                            // 获取用户 ID
                            let userId = userDocument.documentID
                            
                            // 遍历该用户的 "userProducts" 集合中的所有商品
                            self.database.collection("users").document(userId).collection("userProducts").getDocuments { (productSnapshot, productError) in
                                
                                if let productError = productError {
                                    print("Error getting products for user \(userId): \(productError)")
                                } else {
                                    if let productSnapshot = productSnapshot {
                                        for productDocument in productSnapshot.documents {
                                            do {
                                                let productInfo = try productDocument.data(as: product.self)
                                                
                                                if let wcategory = self.categoryName{
                                                    print("warped category: ", wcategory)
                                                    // Check if the product category is categoryName
                                                    if productInfo.category == self.categoryName {
                                                        print(productInfo.category,"this is getted product info")
                                            
                                                        self.filterList.append(productInfo)
                                                        print(self.filterList,"have this in product list")
                                                    }
                                                    
                                                }
                                               
                                                
                                            } catch {
                                                print("Error deserializing product: \(error)")
                                            }
                                        }
                                        self.categoryScreen.tableViewProductLists.reloadData()
                                    }
                                }
                            }
                        }

                    }
                }
            }
       
        
}
    

}




extension ClickCategoryViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewCategoryID, for: indexPath) as! CategoryTableViewCell
        
        let productInfo = filterList[indexPath.row]
        print(productInfo,"ainfo")
        cell.labelDescription.text = productInfo.describe
        cell.labelPrice.text = "$\(productInfo.price)"
        cell.labelProductTitle.text = productInfo.title
       
        if let url = URL(string: productInfo.imagePath) {
            cell.imageProduct.loadRemoteImage(from: url)
        } else {
//            不可能出现的 因为一定有图片上传
            cell.imageProduct.image = UIImage(systemName: "person.circle")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("index: \(indexPath.row)")
        let productInfo = filterList[indexPath.row]
        let productDetailScreen = ProductDetailViewController()
        productDetailScreen.info = productInfo
        self.navigationController?.pushViewController(productDetailScreen, animated: true)
    }
 
}

extension ClickCategoryViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == self.view // Only recognize if tapping on the view, not on the table view cells
    }
}
