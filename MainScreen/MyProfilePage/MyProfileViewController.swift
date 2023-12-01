//
//  MyProfileViewController.swift
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

class MyProfileViewController: UIViewController {
    let MyProfileScreen = MyProfileView()
    
    var currentUser:FirebaseAuth.User?
    
    let database = Firestore.firestore()
    
    let childProgressView = ProgressSpinnerViewController()
    
    var selectedSchool = schoolList[0]
    var pickedImage:UIImage?
    
    let storage = Storage.storage()
    
    var profilePhotoURL:URL?
    
    override func loadView() {
        view = MyProfileScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        MyProfileScreen.buttonEdit.menu = getMenuImagePicker()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        title = "My Profile"
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
        
        MyProfileScreen.buttonMyPost.addTarget(self, action: #selector(buttonMyPost), for: .touchUpInside)
        MyProfileScreen.buttonEdit.addTarget(self, action: #selector(buttonEdit), for: .touchUpInside)
        MyProfileScreen.buttonRightArrow.addTarget(self, action: #selector(buttonRightArrow), for: .touchUpInside)
        //MyProfileScreen.pickerViewSchool.delegate = self
       // MyProfileScreen.pickerViewSchool.dataSource = self
        
        hideKeyboardOnTapOutside()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let urlString = GlobalData.shared.userInfo?.imageUrl {
            Utilities.downloadImage(from: urlString) { image in
                self.MyProfileScreen.imagePic.image = image
            }
        }

        MyProfileScreen.labelUsername.text = GlobalData.shared.userInfo?.userName
    }

    
    func hideKeyboardOnTapOutside(){
            //MARK: recognizing the taps on the app screen, not the keyboard...
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
            view.addGestureRecognizer(tapRecognizer)
        }
        
    
    @objc func buttonRightArrow(){
        let showprofileScreen = ShowProfileViewController()
        self.navigationController?.pushViewController(showprofileScreen, animated: true)
    }
    @objc func buttonEdit(){
        let editprofileScreen = EditProfileViewController()
        self.navigationController?.pushViewController(editprofileScreen, animated: true)
    }
    
    @objc func buttonMyPost(){
        let myPostScreen = MyPostViewController()
        self.navigationController?.pushViewController(myPostScreen, animated: true)
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
        
       // photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
    }

    @objc func onRegisterTapped(){
        //MARK: creating a new user on Firebase with photo...
      //  uploadProfilePhotoToStorage()
    }
    
    //MARK: Hide Keyboard...
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
    
    
    
}

