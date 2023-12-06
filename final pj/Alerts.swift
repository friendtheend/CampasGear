//
//  ValidationAlerts.swift
//  final pj
//
//  Created by 郭 on 2023/12/1.
//


import Foundation
import UIKit

class Alerts{
    
    static func isValidEmail(_ email: String) -> Bool {
        // Adjust the regex to include only '.edu' domain emails
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.edu"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    //MARK: error alerts...
    static func showErrorAlert(_ viewController: UIViewController, _ text: String){
        let alert = UIAlertController(title: "Error!", message: text, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        viewController.present(alert, animated: true)
    }
    
    //MARK: post success...
    static func createSuccess(_ viewController: UIViewController, _ text: String){
        let alert = UIAlertController(title: "Success!", message: text, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        viewController.present(alert, animated: true)
    }
    
}
