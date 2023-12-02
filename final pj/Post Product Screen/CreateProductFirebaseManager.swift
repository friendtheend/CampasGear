//
//  CreateProductFirebaseManager.swift
//  final pj
//
//  Created by 郭 on 2023/12/1.
//

import Foundation
import UIKit


extension CreateProductViewController{
    
    func storeNewProduct(product:product){
        if let userID = self.uid {
            
            let productData: [String: Any] = [
                "title": product.title,
                "describe": product.describe,
                "price": product.price,
                "contactInfo":product.contactInfo,
                "imagePath":product.imagePath,
                "seller":userID,
                "hasSold":false
            ]
            
            let refDoc = self.database.collection("users").document(userID)
            let productCollection = refDoc.collection("userProducts")
            productCollection.document().setData(productData, merge: true) { error in
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
                    print("Document successfully written!")
                }
            }
            
        } else {
           print("uid empty")
        }
    }
}
