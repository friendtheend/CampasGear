//
//  EditProfileViewController.swift
//  final pj
//
//  Created by 林允儿老公专属Mac on 2023/11/30.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
import FirebaseFirestoreSwift
import PhotosUI

class EditProfileViewController: UIViewController {
    let EditProfileScreen = EditProfileView()
    
    var currentUser:FirebaseAuth.User?
    
    let database = Firestore.firestore()
    
    let childProgressView = ProgressSpinnerViewController()
    
    var selectedSchool = schoolList[0]
    var pickedImage:UIImage?
    
    let storage = Storage.storage()
    
    var profilePhotoURL:URL?
    
    override func loadView() {
        view = EditProfileScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        if let urlString = GlobalData.shared.userInfo?.imageUrl {
//            print(urlString)
//            Utilities.downloadImage(from: urlString) { image in
//                self.EditProfileScreen.buttonTakePhoto.image(for: <#T##UIControl.State#>) = image
//            }
//        }
//
        if let urlString = GlobalData.shared.userInfo?.imageUrl {
            if !urlString.isEmpty {
                Utilities.downloadImage(from: urlString) { image in
                    
                    // Ensure that image download is successful
                    guard let downloadedImage = image else {
                        print("Failed to download image")
                        return
                    }
                    print(downloadedImage)

                    DispatchQueue.main.async {
                        self.EditProfileScreen.buttonTakePhoto.setImage(downloadedImage.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.EditProfileScreen.buttonTakePhoto.imageView?.tintColor = UIColor.clear
                        //self.EditProfileScreen.buttonTakePhoto.adjustsImageWhenHighlighted = false
                    }

                }
            }
            
        } else {
            print("URL string is nil")
        }
        
        EditProfileScreen.buttonTakePhoto.menu = getMenuImagePicker()
//        EditProfileScreen.textFieldEmail.text = GlobalData.shared.userInfo? .email
        EditProfileScreen.textFieldAddress.text = GlobalData.shared.userInfo? .address
        EditProfileScreen.textFieldPhone.text = GlobalData.shared.userInfo? .phoneNum
        EditProfileScreen.textFieldUserName.text = GlobalData.shared.userInfo? .userName
        
        navigationController?.navigationBar.prefersLargeTitles = true
        EditProfileScreen.buttonRegister.addTarget(self, action: #selector(onRegisterTapped), for: .touchUpInside)
        title = "Edit My Profile"
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
        
        EditProfileScreen.buttonRegister.addTarget(self, action: #selector(onRegisterTapped), for: .touchUpInside)
        
        EditProfileScreen.pickerViewSchool.delegate = self
        EditProfileScreen.pickerViewSchool.dataSource = self
        
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
       // cameraController.delegate = self
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

    @objc func onRegisterTapped(){
        //MARK: creating a new user on Firebase with photo...
        uploadProfilePhotoToStorage()
    }
    
    //MARK: Hide Keyboard...
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
    
    
}

