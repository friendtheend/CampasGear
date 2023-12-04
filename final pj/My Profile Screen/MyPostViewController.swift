//
//  MyPostViewController.swift
//  final pj
//
//  Created by 林允儿老公专属Mac on 2023/12/1.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import Foundation


class MyPostViewController: UIViewController {
    
    let notificationCenter = NotificationCenter.default
    
    let database = Firestore.firestore()
    
    var myProducts = [product]()
//
//    var selectedSchool = schoolList[0]
//    
//    var handleAuth: AuthStateDidChangeListenerHandle?
//    
//    var currentUser:FirebaseAuth.User?

    let MyPostScreen = MyPostView()
    
    override func loadView() {
        view = MyPostScreen
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Post"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        
        hideKeyboardOnTapOutside()
        
        self.database.collection("users").document(GlobalData.shared.userInfo!.userId).collection("userProducts").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                self.myProducts = [] // Clearing the existing products
                for document in querySnapshot!.documents {
                    var product = try? document.data(as: product.self)
                    product?.documentID = document.documentID // Storing the documentID
                    if let product = product {
                        self.myProducts.append(product)
                    }
                }
                print(self.myProducts)
                self.MyPostScreen.tableViewMyPost.reloadData()
            }
        }


        
        //Cell实现
        MyPostScreen.tableViewMyPost.delegate = self
        MyPostScreen.tableViewMyPost.dataSource = self
        MyPostScreen.tableViewMyPost.separatorStyle = .none
        
        //MyPostScreen.tableViewMyPost.isEditing = true //右滑cell删除键
    }
    

    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
    
    func hideKeyboardOnTapOutside(){
        //MARK: recognizing the taps on the app screen, not the keyboard...
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        view.addGestureRecognizer(tapRecognizer)
    }
    
}


extension MyPostViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myPostId", for: indexPath) as! MyPostTableViewCell
        cell.labelProductTitle.text = myProducts[indexPath.row].title
        cell.labelStatus.text = myProducts[indexPath.row].hasSold ? "sold out" : "selling"
        cell.labelPrice.text = String(myProducts[indexPath.row].price)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    //右滑cell删除功能
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deleteAlert = UIAlertController(title: "Delete", message: "Are you sure want to delete?", preferredStyle: .alert)
            deleteAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {(_) in
                    // Fetch the documentID of the product to be deleted
                    if let documentID = self.myProducts[indexPath.row].documentID {
                        // Delete the product from Firestore
                        self.database.collection("users").document(GlobalData.shared.userInfo!.userId).collection("userProducts").document(documentID).delete() { err in
                            if let err = err {
                                print("Error removing document: \(err)")
                                self.showAlertText(text: "Error removing product: \(err)")
                            } else {
                                print("Document successfully removed!")
                            }
                        }

                        // Remove the product from the local data source
                        self.myProducts.remove(at: indexPath.row)

                        // Delete the row from the table view
                        tableView.deleteRows(at: [indexPath], with: .fade)
                    }
                })
            )
            deleteAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            
            self.present(deleteAlert, animated: true)
            
        }
    }

    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let toggleAction = UIContextualAction(style: .normal, title: "Toggle Sold") { [weak self] (action, view, completionHandler) in
            guard let self = self else { return }
            
            // Toggle the hasSold status
            var product = self.myProducts[indexPath.row]
            product.hasSold.toggle()

            // Update the product in Firestore
            self.database.collection("users").document(GlobalData.shared.userInfo!.userId).collection("userProducts").document(product.documentID!).updateData([
                "hasSold": product.hasSold
            ]) { err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                    self.myProducts[indexPath.row] = product
                    tableView.reloadRows(at: [indexPath], with: .automatic)
                }
            }
            completionHandler(true)
        }

        toggleAction.backgroundColor = .blue // Choose your color

        let configuration = UISwipeActionsConfiguration(actions: [toggleAction])
        return configuration
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let otherId = contactsList[indexPath.row].userId
//        if let uwId = self.currentUser?.uid{
////            这里是通过sort双方的uid 创建一个独一无二的chatIdentifier，通过这个chatIdentifier可以查看双方的聊天记录
//            let userIds = [otherId, uwId]
//            let sortedIds = userIds.sorted()
//            self.chatIdentifier = sortedIds.joined(separator: "_")
//            self.getAndReloadMessage()
//                }
        }
 
}
