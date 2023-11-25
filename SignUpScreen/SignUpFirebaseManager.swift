//
//  RegisterFirebaseManager.swift
//  WA8
//
//  Created by 郭 on 2023/11/15.
//

import Foundation
import FirebaseAuth
import UIKit

extension SignUpScreenController{
    
    func registerNewAccount(){
        //MARK: create a Firebase user with email and password...
        guard let unwrappedName = SignUpScreen.textFieldUserName.text else {
            showAlertText(text:"error")
            return
        }
        guard !unwrappedName.isEmpty else {
            showAlertText(text: "Name can't be empty!")
            return
        }
        
        // get Email
        guard let unwrappedEmail = SignUpScreen.textFieldEmail.text else {
            showAlertText(text:"error")
            return
        }
        guard !unwrappedEmail.isEmpty else {
            return showAlertText(text: "Email can't be empty!")
        }
        guard isValidEmail(unwrappedEmail) else {
            return showAlertText(text: "Invalid Email!")
        }
        
        // get PhoneNum
        guard let unwrappedPhoneNum = SignUpScreen.textFieldPhone.text else {
            showAlertText(text: "Error")
            return
        }
        guard !unwrappedPhoneNum.isEmpty else {
            showAlertText(text: "Phone Number can't be empty!")
            return
        }
        guard isValidPhoneNum(unwrappedPhoneNum) else {
            return showAlertText(text: "Invalid Phone Number!")
        }
        
        // get Address
        guard let unwrappedAddress = SignUpScreen.textFieldAddress.text else {
            showAlertText(text: "error")
            return
        }
        guard !unwrappedAddress.isEmpty else {
            showAlertText(text: "Address can't be empty!")
            return
        }
        
        // get school
//        guard let unwrappedSchool = SignUpScreen.textFieldSchool.text else {
//            showAlertText(text: "error")
//            return
//        }
        guard !selectedSchool.isEmpty else {
            showAlertText(text: "School can't be empty!")
            return
        }
        
        // get password
        guard let unwrappedPassword = SignUpScreen.textFieldPassword.text else {
            showAlertText(text: "error")
            return
        }
        guard unwrappedPassword.count >= 6 else {
            showAlertText(text: "The password should have at least 6 digit!")
            return
        }
        
        // get verifyPassword
        guard let unwrappedVerifyPassword = SignUpScreen.textFieldVerifyPassword.text else {
            showAlertText(text: "error")
            return
        }
        guard unwrappedVerifyPassword == unwrappedPassword else {
            showAlertText(text: "Two password not match!")
            return
        }
        
        showActivityIndicator()
        Auth.auth().createUser(withEmail: unwrappedEmail, password: unwrappedPassword, completion: {result, error in
            self.hideActivityIndicator()
            if error == nil{
//                        register sucess and get this new created user's u id
                let uid = result!.user.uid
               
                //MARK: the user creation is successful...
                    
                    let userDocument = self.database
                           .collection("users")
                           .document(uid)
                          

                       do{
                           self.showActivityIndicator()
                           try userDocument.setData([
                            "email": unwrappedEmail,
                            "userName": unwrappedName,
                            "userId": uid,
                            "phoneNum": unwrappedPhoneNum,
                            "school": self.selectedSchool,
                            "address": unwrappedAddress
                            "address": unwrappedAddress,
                            "imageUrl": self.profilePhotoURL
     
                           ]) { error in
                               self.hideActivityIndicator()
                               if error == nil{
                                   print("store success")
                                   self.showSuccessText(text: "Success")
                               }
                           }
                        
                       }catch{
                           self.hideActivityIndicator()
                           print("Error adding document!")
                           self.showAlertText(text: "Error adding document!")
                       }
            
                self.navigationController?.popViewController(animated: true)
            }else{
                //MARK: there is a error creating the user...
                print(error)
               // self.showAlertText(text: String(describing: error))
                self.showAlertText(text: "This email address has been used!")
            }
        })
        
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    func isValidPhoneNum(_ phoneNum: String) -> Bool {
        let phoneRegEx = #"^\(?\d{3}\)?[ -]?\d{3}[ -]?\d{4}$"#
        
        let phonePred = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        return phonePred.evaluate(with: phoneNum)
    }
    
   
}
