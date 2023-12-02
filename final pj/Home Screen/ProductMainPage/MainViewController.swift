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
        
        //MARK: user is logged in...
        let barIcon = UIBarButtonItem(
            image: UIImage(systemName: "rectangle.portrait.and.arrow.forward"),
            style: .plain,
            target: self,
            action: #selector(self.onLogOutBarButtonTapped)
        )
        let barText = UIBarButtonItem(
            title: "Logout",
            style: .plain,
            target: self,
            action: #selector(self.onLogOutBarButtonTapped)
        )
        
        self.navigationItem.rightBarButtonItems = [barIcon, barText]
        
        hideKeyboardOnTapOutside()
    }

//
//    override func viewWillAppear(_ animated: Bool) {
//        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
//            if user == nil{
//                print("user is empty")
//
//            }else{
//                print("user not empty")
//                self.currentUser = user
//
//                //MARK: user is logged in...
//                let barIcon = UIBarButtonItem(
//                    image: UIImage(systemName: "rectangle.portrait.and.arrow.forward"),
//                    style: .plain,
//                    target: self,
//                    action: #selector(self.onLogOutBarButtonTapped)
//                )
//                let barText = UIBarButtonItem(
//                    title: "Logout",
//                    style: .plain,
//                    target: self,
//                    action: #selector(self.onLogOutBarButtonTapped)
//                )
//
//                self.navigationItem.rightBarButtonItems = [barIcon, barText]
//
//                self.database.collection("users").document(user!.uid).getDocument { (documentSnapshot, error) in
//                    if let error = error {
//                        print("Error fetching document: \(error)")
//                    } else if let documentSnapshot = documentSnapshot, documentSnapshot.exists {
//                        // Extract user data from documentSnapshot
//                        if let data = documentSnapshot.data() {
//                            let userInfo = UserInfo(dictionary: data)
//                            GlobalData.shared.userInfo = userInfo
//                            //print("userinfo:", GlobalData.shared.userInfo)
//                        }
//                    } else {
//                        print("Document does not exist")
//                    }
//                }

//            }
//
//        }
//
//    }
    
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
        view.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func onLogOutBarButtonTapped(){
        let logoutAlert = UIAlertController(title: "Logging out!", message: "Are you sure want to log out?", preferredStyle: .alert)
        logoutAlert.addAction(UIAlertAction(title: "Yes, log out!", style: .default, handler: {(_) in
                do{
                    try Auth.auth().signOut()
                    self.dismiss(animated: true, completion: nil)
                }catch{
                    print("Error occured!")
                }
            })
        )
        logoutAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        self.present(logoutAlert, animated: true)
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewProductsID, for: indexPath) as! ProductTableViewCell
        
        let productInfo = productList[indexPath.row]
        print(productInfo,"ainfo")
        cell.labelDescription.text = "hello"
        cell.labelPrice.text = String(productInfo.price)
        cell.labelProductTitle.text = productInfo.title
       
        if let url = URL(string: productInfo.imagePath) {
            cell.imageProduct.loadRemoteImage(from: url)
        } else {
            cell.imageProduct.image = UIImage(systemName: "person.circle")
        }
        return cell
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
