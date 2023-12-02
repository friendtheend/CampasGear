//
//  LogInViewController.swift
//  final pj
//
//  Created by 林允儿老公专属Mac on 2023/11/21.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class LogInViewController: UIViewController {
        
    let LoginScreen = LoginScreenView()
    
//    let childProgressView = ProgressSpinnerViewController()
//    
//    
//    let database = Firestore.firestore()
//    
    var handleAuth: AuthStateDidChangeListenerHandle?
//    
    var currentUser:FirebaseAuth.User?

        
        override func loadView() {
            view = LoginScreen
        }

        override func viewDidLoad() {
            super.viewDidLoad()
            
            navigationController?.navigationBar.prefersLargeTitles = true

            LoginScreen.buttonSignup.addTarget(self, action: #selector(buttonSignup), for: .touchUpInside)
            LoginScreen.buttonLogin.addTarget(self, action: #selector(buttonLogin), for: .touchUpInside)
       
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
            tapRecognizer.cancelsTouchesInView = false
            view.addGestureRecognizer(tapRecognizer)

        }


        //MARK: Hide Keyboard...
        @objc func hideKeyboardOnTap(){
            //MARK: removing the keyboard from screen...
            view.endEditing(true)
        }
        
        
        @objc func buttonSignup(){
            let SignUpScreen = SignUpScreenController()
            self.navigationController?.pushViewController(SignUpScreen, animated: true)
        }
        
        

        
        @objc func buttonLogin(){
            if let email = LoginScreen.textFieldName.text,
               let password = LoginScreen.textFieldPassword.text{
                if !email.isEmpty && !password.isEmpty{
                    if !isValidEmail(email){
                        showAlertText(text:"please enter valid email~~")
                    }
                    //数据库登录
                    self.signInToFirebase(email: email, password: password)
                    
                }else{
                    showAlertText(text:"please enter all information")
                }
            }
        }
        
    func signInToFirebase(email: String, password: String){
           //MARK: can you display progress indicator here?
           //MARK: authenticating the user...
           showActivityIndicator()
           Auth.auth().signIn(withEmail: email, password: password, completion: {(result, error) in
                self.hideActivityIndicator()
               if error == nil{
                   print("sign in successful")
                    let mainScreen = MainViewController()
                   self.navigationController?.setViewControllers([mainScreen], animated: true)

               }else{
                   self.showAlertText(text:"password or user name fail. Please try again~")
               }
           })
       }

        
        func isValidEmail(_ email: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
        }
        

        
    }


