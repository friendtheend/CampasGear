//
//  ShowProfileViewController.swift
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

class ShowProfileViewController: UIViewController {
    let showProfileScreen = ShowProfileView()
    
    var currentUser:FirebaseAuth.User?
    
    let database = Firestore.firestore()
    
    let childProgressView = ProgressSpinnerViewController()
    
    var selectedSchool = schoolList[0]
    var pickedImage:UIImage?
    
    let storage = Storage.storage()
    
    var profilePhotoURL:URL?
    
    override func loadView() {
        view = showProfileScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationController?.navigationBar.prefersLargeTitles = true
        //title = "My Profile"
        
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
        
    
        hideKeyboardOnTapOutside()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let urlString = GlobalData.shared.userInfo?.imageUrl {
            if urlString.isEmpty {
                self.showProfileScreen.imagePic.image = UIImage(systemName: "person.fill")
            } else {
                Utilities.downloadImage(from: urlString) { image in
                    self.showProfileScreen.imagePic.image = image
                }
            }
        }
        
        showProfileScreen.labelUsername.text = "Name: \(GlobalData.shared.userInfo?.userName ?? "Not available")"
        showProfileScreen.labelEmail.text = "Email: \(GlobalData.shared.userInfo?.email ?? "Not available")"
        showProfileScreen.labelSchool.text = "School: \(GlobalData.shared.userInfo?.school ?? "Not available")"
        showProfileScreen.labelPhone.text = "Phone: \(GlobalData.shared.userInfo?.phoneNum ?? "Not available")"
        showProfileScreen.labelAddress.text = "Address: \(GlobalData.shared.userInfo?.address ?? "Not available")"

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
