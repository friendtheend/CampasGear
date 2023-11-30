//
//  MyProfileViewController.swift
//  final pj
//
//  Created by 林允儿老公专属Mac on 2023/11/29.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class MyProfileViewController: UIViewController {
        
    let MyProfileScreen = MyProfileView()
        
        override func loadView() {
            view = MyProfileScreen
        }

        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            //title = "My Profile"

        }


        //MARK: Hide Keyboard...
        @objc func hideKeyboardOnTap(){
            //MARK: removing the keyboard from screen...
            view.endEditing(true)
        }
        
    
        
    }


