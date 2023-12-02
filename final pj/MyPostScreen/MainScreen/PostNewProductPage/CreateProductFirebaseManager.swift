//
//  CreateProductFirebaseManager.swift
//  final pj
//
//  Created by 郭 on 2023/12/1.
//

import Foundation


extension CreateProductViewController{
    
    func storeNewProduct(product:product){
        
        let productData: [String: Any] = [
            "title": product.title,
            "photoPath":product.imagePath,
            "describe": product.describe,
            "price": product.price,
            "contactInfo":product.contactInfo,
        ]
        if let userID = self.uid {
            
            let refDoc = self.database.collection("users").document(userID)
            refDoc.collection("products").document().setData(productData, merge: true) { error in
                if let error = error {
                    print("Error writing document: \(error)")
                } else {
                    print("Document successfully written!")
                }
            }
            
        } else {
           print("uid empty")
        }

        
        
    }
    
//    func uploadProfilePhotoToStorage(){
//           var profilePhotoURL:URL?
//
//           //MARK: Upload the profile photo if there is any...
//           if let image = pickedImage{
//               if let jpegData = image.jpegData(compressionQuality: 80){
//                   let storageRef = storage.reference()
//                   let imagesRepo = storageRef.child("imagesUsers")
//
//                   //MARK: path in storage for this image
//                   let imageRef = imagesRepo.child("\(NSUUID().uuidString).jpg")
//
//                   let uploadTask = imageRef.putData(jpegData, completion: {(metadata, error) in
//                       if error == nil{
//                           imageRef.downloadURL(completion: {(url, error) in
//                               if error == nil{
//                                   profilePhotoURL = url
//                                   self.registerNewAccount(photoURL: profilePhotoURL)
//                               }
//                           })
//                       }
//                   })
//               }
//           }else{
//               registerNewAccount(photoURL: profilePhotoURL)
//           }
//       }
//
//



    


   
}
