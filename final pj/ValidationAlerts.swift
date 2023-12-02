//
//  ValidationAlerts.swift
//  final pj
//
//  Created by 郭 on 2023/12/1.
//


import Foundation
import UIKit

class ValidationAlerts{
    
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    
        print(emailPred.evaluate(with: email))
        return emailPred.evaluate(with: email)
    }
    
    //MARK: error alerts...
    static func showErrorAlert(_ viewController: UIViewController, _ text: String){
        let alert = UIAlertController(title: "Error!", message: text, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        viewController.present(alert, animated: true)
    }
    
}
