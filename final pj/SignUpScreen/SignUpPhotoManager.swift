//
//  SignUpPhotoManager.swift
//  final pj
//
//  Created by calvin on 2023/11/23.
//

import UIKit
import PhotosUI
import Foundation
import FirebaseAuth
import FirebaseStorage

//MARK: adopting required protocols for PHPicker...
extension SignUpScreenController:PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        print(results)
        
        let itemprovider = results.map(\.itemProvider)
        
        for item in itemprovider{
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(
                    ofClass: UIImage.self,
                    completionHandler: { (image, error) in
                        DispatchQueue.main.async{
                            if let uwImage = image as? UIImage{
                                self.SignUpScreen.buttonTakePhoto.setImage(
                                    uwImage.withRenderingMode(.alwaysOriginal),
                                    for: .normal
                                )
                                self.pickedImage = uwImage
                            }
                        }
                    }
                )
            }
        }
    }
}

//MARK: adopting required protocols for UIImagePicker...
extension SignUpScreenController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage{
            self.SignUpScreen.buttonTakePhoto.setImage(
                image.withRenderingMode(.alwaysOriginal),
                for: .normal
            )
            self.pickedImage = image
        }else{
            // Do your thing for No image loaded...
        }
    }
}

extension SignUpScreenController{
    func uploadProfilePhotoToStorage(){
        
        //MARK: Upload the profile photo if there is any...
        if let image = pickedImage{
            if let jpegData = image.jpegData(compressionQuality: 80){
                let storageRef = storage.reference()
                let imagesRepo = storageRef.child("imagesUsers")
                let imageRef = imagesRepo.child("\(NSUUID().uuidString).jpg")
                
                showActivityIndicator()
                let uploadTask = imageRef.putData(jpegData, completion: {(metadata, error) in
                    self.hideActivityIndicator()
                    if error == nil{
                        imageRef.downloadURL(completion: {(url, error) in
                            if error == nil{
                                self.profilePhotoURL = url
                                self.registerNewAccount()
                            }
                        })
                    } else {
                        self.hideActivityIndicator()
                        print(error)
                    }
                })
            } else {
                print("an error occured")
            }
        }else{
            registerNewAccount()
        }
    }
    
}

