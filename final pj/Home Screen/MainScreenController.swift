//
//  MainScreenController.swift
//  final pj
//
//  Created by 林允儿老公专属Mac on 2023/11/29.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class MainScreenController: UITabBarController, UITabBarControllerDelegate {
    var handleAuth: AuthStateDidChangeListenerHandle?
    
    var currentUser:FirebaseAuth.User?
    
    let database = Firestore.firestore()

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //MARK: setting up red tab bar...
        let mainScreen = MainViewController()
        let tabMainPage = UINavigationController(rootViewController: mainScreen)
        let tabMainBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "h.square")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(systemName: "h.square.fill")
        )
        tabMainPage.tabBarItem = tabMainBarItem
        tabMainPage.title = "Home"
        
        //MARK: setting up green tab bar...
        let postScreen = CreateProductViewController()
        let tabCreateProduct = UINavigationController(rootViewController: postScreen)
        let tabGreenBarItem = UITabBarItem(
            title: "+",
            image: UIImage(systemName: "n.square")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(systemName: "n.square.fill")
        )
        tabCreateProduct.tabBarItem = tabGreenBarItem
        tabCreateProduct.title = "Post"
        
        //MARK: setting up blue tab bar...
        let tabMyProfile = UINavigationController(rootViewController: MyProfileViewController())
        let tabMyProfileBarItem = UITabBarItem(
            title: "Me",
            image: UIImage(systemName: "m.square")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(systemName: "m.square.fill")
        )
        tabMyProfile.tabBarItem = tabMyProfileBarItem
        tabMyProfile.title = "Me"

        //MARK: setting up this view controller as the Tab Bar Controller...
        self.viewControllers = [tabMainPage, tabCreateProduct, tabMyProfile]
        
        //MARK: get userInfo
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
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
        
        self.present(logoutAlert, animated: true)
    }

}
