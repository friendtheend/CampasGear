//
//  CreateProductFirebaseManager.swift
//  final pj
//
//  Created by 郭 on 2023/12/1.
//

import Foundation
import UIKit
import FirebaseFirestore



extension CreateProductViewController{
    
    func uploadProfilePhotoToStorage(product: product){
           var profilePhotoURL:URL?
           
           //MARK: Upload the profile photo if there is any...
           if let image = pickedImage{
               if let jpegData = image.jpegData(compressionQuality: 80){
                   let storageRef = storage.reference()
                   let imagesRepo = storageRef.child("imagesUsers")
                   
                   //MARK: path in storage for this image
                   let imageRef = imagesRepo.child("\(NSUUID().uuidString).jpg")
                   
                   showActivityIndicator()
                   let uploadTask = imageRef.putData(jpegData, completion: {(metadata, error) in
                       self.hideActivityIndicator()
                       if error == nil{
                           imageRef.downloadURL(completion: {(url, error) in
                               if error == nil{
                                   profilePhotoURL = url
                                   self.storeNewProduct(product: product, photoURL: profilePhotoURL)
                               }
                           })
                       }
                   })
               }
           }else{
               storeNewProduct(product: product,photoURL: profilePhotoURL)
           }
       }
    
    func storeNewProduct(product:product,photoURL: URL?){
        let userProfilePath = photoURL?.absoluteString ?? ""
        let creationTimestamp = Timestamp(date: product.creationDate ?? Date())

        let productData: [String: Any] = [
            "title": product.title,
            "category": selectedCategory,
            "describe": product.describe,
            "price": product.price,
            "contactInfo":product.contactInfo,
            "imagePath": userProfilePath,
            "seller": GlobalData.shared.userInfo!.userName,
            "hasSold":false,
            "createTime":creationTimestamp
        ]
        
        let refDoc = self.database.collection("users").document(GlobalData.shared.userInfo!.userId)
        let productCollection = refDoc.collection("userProducts")
        showActivityIndicator()
        productCollection.document().setData(productData, merge: true) { error in
            self.hideActivityIndicator()
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                Alerts.createSuccess(self, "successfully post")
                
                //MARK: delete user entered product info...
                self.createProductScreen.textFieldTitle.text = ""
                self.createProductScreen.textFieldDescribe.text = ""
                self.createProductScreen.textFieldPrice.text = ""
                self.createProductScreen.textFieldContactInfo.text = ""
                self.createProductScreen.buttonTakePhoto.setImage(UIImage(systemName: "camera.fill"), for: .normal)
                self.selectedCategory = categoryList[0]
                print("Document successfully written!")
            }
        }
            
    }
}
