//
//  CreateProductViewController.swift
//  final pj
//
//  Created by 林允儿老公专属Mac on 2023/11/29.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
import FirebaseFirestoreSwift
import PhotosUI

class CreateProductViewController: UIViewController {
    
    let createProductScreen = CreateProductView()
    
    var currentUser:FirebaseAuth.User?
    
    var uid : String?
    
    let database = Firestore.firestore()
    
    let childProgressView = ProgressSpinnerViewController()
    
    var selectedSchool = schoolList[0]
    
    var pickedImage:UIImage?
    
    let storage = Storage.storage()
    
    var imageURL:URL?
    
    override func loadView() {
        view = createProductScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Post your product"
        navigationController?.navigationBar.prefersLargeTitles = true
       
        createProductScreen.buttonTakePhoto.menu = getMenuImagePicker()
        
        createProductScreen.buttonSave.addTarget(self, action: #selector(onSaveTapped), for: .touchUpInside)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
        
        hideKeyboardOnTapOutside()
    }
    
    func hideKeyboardOnTapOutside(){
            //MARK: recognizing the taps on the app screen, not the keyboard...
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
            view.addGestureRecognizer(tapRecognizer)
        }
        
    func getMenuImagePicker() -> UIMenu{
        let menuItems = [
            UIAction(title: "Camera",handler: {(_) in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery",handler: {(_) in
                self.pickPhotoFromGallery()
            })
        ]
        
        return UIMenu(title: "Select source", children: menuItems)
    }
    
    //MARK: take Photo using Camera...
    func pickUsingCamera(){
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }
    
    //MARK: pick Photo using Gallery...
    func pickPhotoFromGallery(){
        //MARK: Photo from Gallery...
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
        
        let photoPicker = PHPickerViewController(configuration: configuration)
        
        photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
    }

    @objc func onSaveTapped(){
        //MARK: creating a new product on Firebase with photo...
        if let title = createProductScreen.textFieldTitle.text,
        let imagePath = imageURL?.absoluteString,
        let describe = createProductScreen.textFieldDescribe.text,
        let price = createProductScreen.textFieldPrice.text,
           let contactInfo = createProductScreen.textFieldContactInfo.text{
            if title.isEmpty{
                Alerts.showErrorAlert(self,  "title can not be empty")
            }else if (describe.isEmpty){
                Alerts.showErrorAlert(self,  "describe can not be empty")
            }else if(price.isEmpty){
                Alerts.showErrorAlert(self,  "price can not be empty")
            }else if(contactInfo.isEmpty){
                Alerts.showErrorAlert(self,  "contact info can not be empty")
            }else if(imagePath.isEmpty){
                Alerts.showErrorAlert(self,  "image info can not be empty")
            }else{
                print("here")
                print("uid",uid)
                if let UID = self.uid{
                    let newProduct = product(title: title, describe: describe, price: Int(price)!, contactInfo: contactInfo, imagePath: imagePath,seller: UID, hasSold: false)
                    storeNewProduct(product: newProduct)
                }
            }
        }
        
    }
    
  
    
    //MARK: Hide Keyboard...
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
    
    
}
