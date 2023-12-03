//
//  EditFirebaseManager.swift
//  final pj
//
//  Created by calvin on 2023/12/3.
//

import Foundation

import Foundation
import FirebaseAuth
import UIKit

//extension EditProfileViewController{
//
//    func registerNewAccount(){
//        //MARK: create a Firebase user with email and password...
//        guard let unwrappedName = EditProfileScreen.textFieldUserName.text else {
//            showAlertText(text:"error")
//            return
//        }
//        guard !unwrappedName.isEmpty else {
//            showAlertText(text: "Name can't be empty!")
//            return
//        }
//
//        // get Email
//        guard let unwrappedEmail = EditProfileScreen.textFieldEmail.text else {
//            showAlertText(text:"error")
//            return
//        }
//        guard !unwrappedEmail.isEmpty else {
//            return showAlertText(text: "Email can't be empty!")
//        }
//        guard isValidEmail(unwrappedEmail) else {
//            return showAlertText(text: "Invalid Email!")
//        }
//
//        // get PhoneNum
//        guard let unwrappedPhoneNum = EditProfileScreen.textFieldPhone.text else {
//            showAlertText(text: "Error")
//            return
//        }
//        guard !unwrappedPhoneNum.isEmpty else {
//            showAlertText(text: "Phone Number can't be empty!")
//            return
//        }
//        guard isValidPhoneNum(unwrappedPhoneNum) else {
//            return showAlertText(text: "Invalid Phone Number!")
//        }
//
//        // get Address
//        guard let unwrappedAddress = EditProfileScreen.textFieldAddress.text else {
//            showAlertText(text: "error")
//            return
//        }
//        guard !unwrappedAddress.isEmpty else {
//            showAlertText(text: "Address can't be empty!")
//            return
//        }
//
//        // get school
////        guard let unwrappedSchool = EditProfileScreen.textFieldSchool.text else {
////            showAlertText(text: "error")
////            return
////        }
//        guard !selectedSchool.isEmpty else {
//            showAlertText(text: "School can't be empty!")
//            return
//        }
//
//        // get password
//        guard let unwrappedPassword = EditProfileScreen.textFieldPassword.text else {
//            showAlertText(text: "error")
//            return
//        }
//        guard unwrappedPassword.count >= 6 else {
//            showAlertText(text: "The password should have at least 6 digit!")
//            return
//        }
//
//        // get verifyPassword
//        guard let unwrappedVerifyPassword = EditProfileScreen.textFieldVerifyPassword.text else {
//            showAlertText(text: "error")
//            return
//        }
//        guard unwrappedVerifyPassword == unwrappedPassword else {
//            showAlertText(text: "Two password not match!")
//            return
//        }
//
//        showActivityIndicator()
//        Auth.auth().createUser(withEmail: unwrappedEmail, password: unwrappedPassword, completion: {result, error in
//            self.hideActivityIndicator()
//            if error == nil{
////                        register sucess and get this new created user's u id
//                let uid = result!.user.uid
//
//                //MARK: the user creation is successful...
//
//                    let userDocument = self.database
//                           .collection("users")
//                           .document(uid)
//
//
//                       do{
//                           self.showActivityIndicator()
//                           try userDocument.setData([
//                            "email": unwrappedEmail,
//                            "userName": unwrappedName,
//                            "userId": uid,
//                            "phoneNum": unwrappedPhoneNum,
//                            "school": self.selectedSchool,
//                            "address": unwrappedAddress,
//                            "imageUrl": self.profilePhotoURL?.absoluteString ?? ""  // Convert URL to String
//
//                           ]) { error in
//                               self.hideActivityIndicator()
//                               if error == nil{
//                                   print("store success")
//                                   self.showSuccessText(text: "Success")
//                               }
//                           }
//
//                       }catch{
//                           self.hideActivityIndicator()
//                           print("Error adding document!")
//                           self.showAlertText(text: "Error adding document!")
//                       }
//
//                self.navigationController?.popViewController(animated: true)
//            }else{
//                //MARK: there is a error creating the user...
//                print(error)
//               // self.showAlertText(text: String(describing: error))
//                self.showAlertText(text: "This email address has been used!")
//            }
//        })
//
//    }
//
//    func isValidEmail(_ email: String) -> Bool {
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//        return emailPred.evaluate(with: email)
//    }
//    func isValidPhoneNum(_ phoneNum: String) -> Bool {
//        let phoneRegEx = #"^\(?\d{3}\)?[ -]?\d{3}[ -]?\d{4}$"#
//
//        let phonePred = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
//        return phonePred.evaluate(with: phoneNum)
//    }
//
//
//}


import Foundation
import FirebaseAuth
import UIKit

extension EditProfileViewController {

    func updateUserInformation() {
        // Assume currentUserID is the ID of the user whose information is being edited
        guard let currentUserID = Auth.auth().currentUser?.uid else {
            showAlertText(text: "User not found")
            return
        }

        var updatedUserData: [String: Any] = [:]

        // Update Name
        if let unwrappedName = EditProfileScreen.textFieldUserName.text, !unwrappedName.isEmpty {
            updatedUserData["userName"] = unwrappedName
        }

        // Update Phone Number
        if let unwrappedPhoneNum = EditProfileScreen.textFieldPhone.text, !unwrappedPhoneNum.isEmpty {
            guard isValidPhoneNum(unwrappedPhoneNum) else {
                return showAlertText(text: "Invalid Phone Number!")
            }
            updatedUserData["phoneNum"] = unwrappedPhoneNum
        }

        // Update Address
        if let unwrappedAddress = EditProfileScreen.textFieldAddress.text, !unwrappedAddress.isEmpty {
            updatedUserData["address"] = unwrappedAddress
        }

        // Update School
        if !selectedSchool.isEmpty {
            updatedUserData["school"] = selectedSchool
        }

        // No need to update password here, but you can add if your app allows password change

        // Check if there's any data to update
        guard !updatedUserData.isEmpty else {
            showAlertText(text: "No information to update")
            return
        }

        // Perform the update
        showActivityIndicator()
        let userDocument = database.collection("users").document(currentUserID)
        userDocument.updateData(updatedUserData) { error in
            self.hideActivityIndicator()
            if let error = error {
                print("Error updating document: \(error)")
                self.showAlertText(text: "Error updating document!")
            } else {
                print("Document successfully updated")
                self.showSuccessText(text: "Profile updated successfully")
            }
        }
    }

    // Existing isValidEmail and isValidPhoneNum functions...
    
    func isValidPhoneNum(_ phoneNum: String) -> Bool {
        let phoneRegEx = #"^\(?\d{3}\)?[ -]?\d{3}[ -]?\d{4}$"#
        
        let phonePred = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        return phonePred.evaluate(with: phoneNum)
    }
}
