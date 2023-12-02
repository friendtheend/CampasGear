//
//  SignUpPickerViewManager.swift
//  final pj
//
//  Created by Kai on 11/23/23.
//

import UIKit

extension SignUpScreenController: UIPickerViewDataSource, UIPickerViewDelegate {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return schoolList.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return schoolList[row]
    }
    
    // Implement this method if you want to handle the event when a user selects a row
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Use this to get the selected school
        selectedSchool = schoolList[row]
    }
}

