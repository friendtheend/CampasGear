//
//  GlobalAlert.swift
//  final pj
//
//  Created by Kai on 11/23/23.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlertText(text:String){
        let alert = UIAlertController(
            title: "Error",
            message: "\(text)",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func showSuccessText(text:String){
        let alert = UIAlertController(
            title: "Success",
            message: "\(text)",
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
                self?.navigationController?.popViewController(animated: true)
            }
        
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
}
