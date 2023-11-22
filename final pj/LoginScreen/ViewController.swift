//
//  ViewController.swift
//  final pj
//
//  Created by 林允儿老公专属Mac on 2023/11/21.
//

import UIKit
//import FirebaseCore
//import FirebaseAuth
//import FirebaseFirestore

class ViewController: UIViewController {
        
    let LoginScreen = LoginScreenView()
    
//    let childProgressView = ProgressSpinnerViewController()
//    
//    
//    let database = Firestore.firestore()
//    
//    var handleAuth: AuthStateDidChangeListenerHandle?
//    
//    var currentUser:FirebaseAuth.User?

        
        override func loadView() {
            view = LoginScreen
        }

        override func viewDidLoad() {
            super.viewDidLoad()
            
            //logo摆放
            let imageView = UIImageView(image: UIImage(named: "Logo"))
                imageView.frame = CGRect(x: 138, y: 70, width: 120, height: 120)
                imageView.contentMode = .scaleAspectFit
                view.addSubview(imageView)
            
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
                   // self.signInToFirebase(email: email, password: password)
                    
                }else{
                    showAlertText(text:"please enter all information")
                }
            }
        }
        

        
        func isValidEmail(_ email: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
        }
        
        func showAlertText(text:String){
            let alert = UIAlertController(
                title: "Error",
                message: "\(text)",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
        
    }


