//
//  ProductDetailViewController.swift
//  final pj
//
//  Created by 林允儿老公专属Mac on 2023/11/30.
//

import UIKit

class ProductDetailViewController: UIViewController {
        
    let detailScreen = ProductDetailView()
    
    var info: product?
    
    override func loadView() {
        view = detailScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)

        hideKeyboardOnTapOutside()
        
        //MARK: Show product's detail...
        if let title = info?.title,
           let price = info?.price,
           let describe = info?.describe,
           let contactInfo = info?.contactInfo,
           let seller = info?.seller,
           let category = info?.category,
           let imagePath = info?.imagePath,
           let hasSold = info?.hasSold{
            detailScreen.labelTitle.text = title;
            detailScreen.labelInfo.text = "Contact Info: \(contactInfo)";
            detailScreen.labelPrice.text = "$\(price)";
            detailScreen.labelDescribe.text = "Seller's Description: \(describe)";
            detailScreen.labelSeller.text = "From: \(seller)";
            detailScreen.labelStatus.text = "Status: \(hasSold)";
            detailScreen.labelCategory.text = "Category: \(category)";
            
            if hasSold{
                detailScreen.labelStatus.text = "Status: sold out";
            }else{
                detailScreen.labelStatus.text = "Status: sell";
            }
            
            if let url = URL(string: imagePath) {
                detailScreen.imagePhoto.loadRemoteImage(from: url)
            }else{
                print("no any photo for this item")
            }
        }
    }


    //MARK: Hide Keyboard...
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
