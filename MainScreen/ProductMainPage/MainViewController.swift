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
    
    var handleAuth: AuthStateDidChangeListenerHandle?
    
    var currentUser:FirebaseAuth.User?

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
        
        mainScreen.buttonCreate.addTarget(self, action: #selector(buttonCreate), for: .touchUpInside)
        mainScreen.buttonMyprofile.addTarget(self, action: #selector(buttonMyprofile), for: .touchUpInside)
        
//        //Cell实现
//        mainScreen.tableViewProductLists.delegate = self
//        mainScreen.tableViewProductLists.dataSource = self

//        mainScreen.tableViewProductLists.separatorStyle = .none
    }
    
    @objc func buttonMyprofile(){
        let myprofileScreen = MyProfileViewController()
        self.navigationController?.pushViewController(myprofileScreen, animated: true)
    }
    
    @objc func buttonCreate(){
        let createProductScreen = CreateProductViewController()
        self.navigationController?.pushViewController(createProductScreen, animated: true)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            if user == nil{
                print("user is empty")
                
            }else{
                print("user not empty")
                self.currentUser = user
                
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
                    
                self.database.collection("users").document(user!.uid).getDocument { (documentSnapshot, error) in
                    if let error = error {
                        print("Error fetching document: \(error)")
                    } else if let documentSnapshot = documentSnapshot, documentSnapshot.exists {
                        // Extract user data from documentSnapshot
                        if let data = documentSnapshot.data() {
                            let userInfo = UserInfo(dictionary: data)
                            GlobalData.shared.userInfo = userInfo
                            //print("userinfo:", GlobalData.shared.userInfo)
                        }
                    } else {
                        print("Document does not exist")
                    }
                }

            }
            
        }
        
    }
//    func getAndReloadMessage(){
//        
//        print(self.chatIdentifier,"here")
////        开始对数据库进行查询 查看这两个人是否有聊天记录
//        
//        let refDoc = self.database.collection("chats").document(self.chatIdentifier!).collection("chatDetail")
//        refDoc.getDocuments { (querySnapshot, error) in
//            if let error = error {
//                // 处理错误
//                print("Error getting documents: \(error)")
//            } else {
//                // 检查是否有文档
//                if let snapshot = querySnapshot, !snapshot.isEmpty {
////                    下面是有文档的情况
//                    print("Documents found in chatDetail collection.")
//                    for document in snapshot.documents {
//                        print("\(document.documentID) => \(document.data())")
//                        do{
//                            let info  = try document.data(as: ChatMessage.self)
//                            self.chatSession.append(info)
//                         
//                        }catch{
//                            print(error)
//                        }
//                        
//                        print(self.chatSession,"have this in message list")
//                        let chatScreen = ChatDetailController()
//                        chatScreen.chatSession=self.chatSession
//                        print(print(chatScreen.chatSession,"have this in message list in detail page"))
//                        
//                    
//                    }
//                } else {
////                    下面是没有文档的情况，创建新的聊天文档
//                    print("No chats found in chatDetail collection.")
//    
//                    self.database.collection("chats").document(self.chatIdentifier!).setData([:]) { error in
//                        if let error = error {
//                            print("Error creating new chat session: \(error)")
//                        } else {
//                            print("New chat session created successfully with ID: \(self.chatIdentifier)")
//                        }
//                    }
//                }
//            }
//        }
//        
////        处理完数据库 进入到新的页面
//        let chatScreen = ChatDetailController()
//        chatScreen.chatIdentifier=self.chatIdentifier
//        chatScreen.currentUser = self.currentUser
//        self.navigationController?.pushViewController(chatScreen, animated: true)
//    }
    
    @objc func onLogOutBarButtonTapped(){
        let logoutAlert = UIAlertController(title: "Logging out!", message: "Are you sure want to log out?", preferredStyle: .alert)
        logoutAlert.addAction(UIAlertAction(title: "Yes, log out!", style: .default, handler: {(_) in
                do{
                    try Auth.auth().signOut()
                }catch{
                    print("Error occured!")
                }
            let loginViewController = LogInViewController()
            self.navigationController?.setViewControllers([loginViewController], animated: true)
            })
        )
        logoutAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        // Check if the device is iPad
//        if let popoverController = logoutAlert.popoverPresentationController {
//            popoverController.sourceView = self.view // The view containing the anchor rectangle for the popover.
//            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0) // The rectangle in the specified view in which to anchor the popover.
//            popoverController.permittedArrowDirections = [] // No arrow directions
//        }

        
        self.present(logoutAlert, animated: true)
    }
    
}

//extension MainViewController: UITableViewDelegate, UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return contactsList.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewContactsID, for: indexPath) as! ContactsTableViewCell
//        cell.labelName.text = contactsList[indexPath.row].name
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let otherId = contactsList[indexPath.row].userId
//        if let uwId = self.currentUser?.uid{
////            这里是通过sort双方的uid 创建一个独一无二的chatIdentifier，通过这个chatIdentifier可以查看双方的聊天记录
//            let userIds = [otherId, uwId]
//            let sortedIds = userIds.sorted()
//            self.chatIdentifier = sortedIds.joined(separator: "_")
//            self.getAndReloadMessage()
//                }
//        }
// 
//}
