//
//  SignUpScreenViewController.swift
//  final pj
//
//  Created by 林允儿老公专属Mac on 2023/11/21.
//

import UIKit
//import FirebaseAuth
//import FirebaseFirestore
//import FirebaseFirestoreSwift

class SignUpScreenController: UIViewController {

    let SignUpScreen = SignUpScreenView()
    
//    var currentUser:FirebaseAuth.User?
//    
//    let database = Firestore.firestore()
//    
    let childProgressView = ProgressSpinnerViewController()
    
    override func loadView() {
        view = SignUpScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        SignUpScreen.buttonRegister.addTarget(self, action: #selector(onRegisterTapped), for: .touchUpInside)
        title = "Register"
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
        
        SignUpScreen.buttonRegister.addTarget(self, action: #selector(onRegisterTapped), for: .touchUpInside)
        
    }

    @objc func onRegisterTapped(){
        //MARK: creating a new user on Firebase...
        showActivityIndicator()
    }
    //MARK: Hide Keyboard...
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
    
    
}

