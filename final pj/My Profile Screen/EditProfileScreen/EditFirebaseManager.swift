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
        
        updatedUserData["imageUrl"] = self.profilePhotoURL?.absoluteString ?? ""

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
                
                // update userInfo
                self.database.collection("users").document(currentUserID).getDocument { (documentSnapshot, error) in
                    if let error = error {
                        print("Error fetching document: \(error)")
                    } else if let documentSnapshot = documentSnapshot, documentSnapshot.exists {
                        // Extract user data from documentSnapshot
                        if let data = documentSnapshot.data() {
                            let userInfo = UserInfo(dictionary: data)
                            GlobalData.shared.userInfo = userInfo
                            //print("userinfo:", GlobalData.shared.userInfo)
                        }
                    } else {
                        print("Document does not exist")
                    }
                }
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
