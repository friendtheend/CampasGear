//
//  photoManager.swift
//  final pj
//
//  Created by 郭 on 2023/12/1.
//


import UIKit
import PhotosUI

//MARK: adopting required protocols for PHPicker...
extension CreateProductViewController:PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        let itemprovider = results.map(\.itemProvider)

        
        for item in itemprovider{
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(
                    ofClass: UIImage.self,
                    completionHandler: { (image, error) in
                        DispatchQueue.main.async{
                            if let uwImage = image as? UIImage{
                                self.createProductScreen.buttonTakePhoto.setImage(
                                    uwImage.withRenderingMode(.alwaysOriginal),
                                    for: .normal
                                )
                                self.pickedImage = uwImage
                                
                            }
                        }
                    }
                )
            }
//            下面这个是得到url
            if item.hasItemConformingToTypeIdentifier(UTType.image.identifier) {
                       item.loadFileRepresentation(forTypeIdentifier: UTType.image.identifier) { (url, error) in
                           DispatchQueue.main.async {
                               if let url = url {
                                   self.imageURL = url
                                   print("Image URL: \(url)")
                               }
                           }
                       }
                   }

        }
   
    }
}

//MARK: adopting required protocols for UIImagePicker...
extension CreateProductViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage{
            self.createProductScreen.buttonTakePhoto.setImage(
                image.withRenderingMode(.alwaysOriginal),
                for: .normal
            )
            self.pickedImage = image
        }else{
            // Do your thing for No image loaded...
        }
    }
}


extension CreateProductViewController: UIPickerViewDataSource, UIPickerViewDelegate {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryList.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryList[row]
    }
    
    // Implement this method if you want to handle the event when a user selects a row
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Use this to get the selected school
        selectedCategory = categoryList[row]
    }
}

