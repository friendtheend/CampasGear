//
//  MainScreenController.swift
//  WA8
//
//  Created by 郭 on 2023/11/17.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import Foundation


class MainViewController: UIViewController {
    
    let notificationCenter = NotificationCenter.default
    
    let database = Firestore.firestore()
    
    var selectedSchool = schoolList[0]
    
    var productList = [product]()
    
    var handleAuth: AuthStateDidChangeListenerHandle?
    
    var currentUser:FirebaseAuth.User?
    
    var uid: String?

    let mainScreen = MainScreenView()
    
    override func loadView() {
        view = mainScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        
        mainScreen.pickerSchool.delegate = self
        mainScreen.pickerSchool.dataSource = self
        
        mainScreen.tableViewProductLists.delegate = self
        mainScreen.tableViewProductLists.dataSource = self
        
        mainScreen.tableViewProductLists.separatorStyle = .none

        getProducts()
        
        mainScreen.buttonAppliances.addTarget(self, action: #selector(onButtonAppliancesTapped), for: .touchUpInside)
        
        mainScreen.buttonBeauty.addTarget(self, action: #selector(onButtonBeautyTapped), for: .touchUpInside)
        
        mainScreen.buttonBook.addTarget(self, action: #selector(onButtonBookTapped), for: .touchUpInside)
        
        mainScreen.buttonOther.addTarget(self, action: #selector(onButtonOtherTapped), for: .touchUpInside)
        
        
        hideKeyboardOnTapOutside()
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
                                                // 这里处理每个产品的信息
                                                let productInfo = try productDocument.data(as: product.self)
                                                self.productList.append(productInfo)
                                                self.mainScreen.tableViewProductLists.reloadData()
                                                print(self.productList,"have this in product list")
                                                
                                            } catch {
                                                print("Error deserializing product: \(error)")
                                            }
                                        }
                                    }
                                }
                            }
                        }

                    }
                }
            }
        
        
}
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
    
    func hideKeyboardOnTapOutside(){
        //MARK: recognizing the taps on the app screen, not the keyboard...
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.delegate = self
        view.addGestureRecognizer(tapRecognizer)
    }
    
    
    @objc func onButtonAppliancesTapped(){
        let categoryScreen = ClickCategoryViewController()
        categoryScreen.categoryName = "Appliances"
        self.navigationController?.pushViewController(categoryScreen, animated: true)
    }
    
    @objc func onButtonBeautyTapped(){
        let categoryScreen = ClickCategoryViewController()
        categoryScreen.categoryName = "Beautys"
        self.navigationController?.pushViewController(categoryScreen, animated: true)
    }
    
    @objc func onButtonBookTapped(){
        let categoryScreen = ClickCategoryViewController()
        categoryScreen.categoryName = "Books"
        self.navigationController?.pushViewController(categoryScreen, animated: true)
    }
    
    @objc func onButtonOtherTapped(){
        let categoryScreen = ClickCategoryViewController()
        categoryScreen.categoryName = "Others"
        self.navigationController?.pushViewController(categoryScreen, animated: true)
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewProductsID, for: indexPath) as! ProductTableViewCell
        
        let productInfo = productList[indexPath.row]
        cell.labelDescription.text = productInfo.describe
        cell.labelPrice.text = "$\(productInfo.price)"
        cell.labelProductTitle.text = productInfo.title
       
        if let url = URL(string: productInfo.imagePath) {
            cell.imageProduct.loadRemoteImage(from: url)
        } else {
            cell.imageProduct.image = UIImage(systemName: "person.circle")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("index: \(indexPath.row)")
        let productInfo = productList[indexPath.row]
        let productDetailScreen = ProductDetailViewController()
        productDetailScreen.info = productInfo
        self.navigationController?.pushViewController(productDetailScreen, animated: true)
    }
 
}

extension MainViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == self.view // Only recognize if tapping on the view, not on the table view cells
    }
}
