//
//  ProductDetailViewController.swift
//  final pj
//
//  Created by 林允儿老公专属Mac on 2023/11/30.
//

import UIKit

class ProductDetailViewController: UIViewController {
        
    let ProductDetailScreen = ProductDetailView()
    
     
        override func loadView() {
            view = ProductDetailScreen
        }

        override func viewDidLoad() {
            super.viewDidLoad()
            
            navigationController?.navigationBar.prefersLargeTitles = true

            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
            tapRecognizer.cancelsTouchesInView = false
            view.addGestureRecognizer(tapRecognizer)

        }


        //MARK: Hide Keyboard...
        @objc func hideKeyboardOnTap(){
            //MARK: removing the keyboard from screen...
            view.endEditing(true)
        }
        
        
        
        

        

        
    }
