//
//  CreateProductView.swift
//  final pj
//
//  Created by 林允儿老公专属Mac on 2023/11/29.
//

import UIKit

class CreateProductView: UIView {

    var contentWrapper: UIScrollView! //new
    
    var buttonTakePhoto: UIButton!
    var textFieldTitle: UITextField!
    var textFieldDescribe: UITextField!
    var textFieldPrice:UITextField!
    var textFieldContactInfo: UITextField!
    var buttonSave: UIButton!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white

        setupContentWrapper()
        setupButtonTakePhoto()
        setuptextFieldTitle()
        setuptextFieldDescribe()
        setupTextFieldPrice()
        setupButtonSave()
        setupTextFieldContactInfo()
        
        initConstraints()
    }
    
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setupButtonTakePhoto(){
        buttonTakePhoto = UIButton(type: .system)
        buttonTakePhoto.setTitle("", for: .normal)
        //buttonTakePhoto.setImage(UIImage(systemName: "person.fill"), for: .normal)
        buttonTakePhoto.setImage(UIImage(systemName: "camera.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        buttonTakePhoto.contentHorizontalAlignment = .fill
        buttonTakePhoto.contentVerticalAlignment = .fill
        buttonTakePhoto.imageView?.contentMode = .scaleAspectFit
        buttonTakePhoto.showsMenuAsPrimaryAction = true
        buttonTakePhoto.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonTakePhoto)
    }
    
    func setuptextFieldTitle(){
        textFieldTitle = UITextField()
        textFieldTitle.placeholder = "Title"
        textFieldTitle.keyboardType = .default
        textFieldTitle.borderStyle = .roundedRect
        textFieldTitle.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldTitle)
    }
    
    
    func setuptextFieldDescribe(){
        textFieldDescribe = UITextField()
        textFieldDescribe.placeholder = "Describe your product"
        textFieldDescribe.keyboardType = .emailAddress
        textFieldDescribe.borderStyle = .roundedRect
        textFieldDescribe.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldDescribe)
    }
    
    func setupTextFieldPrice(){
        textFieldPrice = UITextField()
        textFieldPrice.placeholder = "Set your pirce"
        textFieldPrice.borderStyle = .roundedRect
        textFieldPrice.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldPrice)
    }
    
    func setupTextFieldContactInfo(){
        textFieldContactInfo = UITextField()
        textFieldContactInfo.borderStyle = .roundedRect
        textFieldContactInfo.placeholder = "Contact info"
        textFieldContactInfo.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldContactInfo)
    }
    
    func setupButtonSave(){
        buttonSave = UIButton(type: .system)
        buttonSave.setTitle("Save", for: .normal)
        buttonSave.titleLabel?.font = .boldSystemFont(ofSize: 21)
        buttonSave.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonSave)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([

            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor), //new
            
            buttonTakePhoto.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 32),
            buttonTakePhoto.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            buttonTakePhoto.widthAnchor.constraint(equalToConstant: 100),
            buttonTakePhoto.heightAnchor.constraint(equalToConstant: 100),
            
            textFieldTitle.topAnchor.constraint(equalTo: buttonTakePhoto.bottomAnchor, constant: 32),
            textFieldTitle.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            textFieldTitle.widthAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            textFieldDescribe.topAnchor.constraint(equalTo: textFieldTitle.bottomAnchor, constant: 16),
            textFieldDescribe.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            textFieldDescribe.widthAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            textFieldDescribe.heightAnchor.constraint(equalToConstant: 100),
            
            textFieldPrice.topAnchor.constraint(equalTo: textFieldDescribe.bottomAnchor,constant: 16),
            textFieldPrice.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            textFieldPrice.widthAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            textFieldContactInfo.topAnchor.constraint(equalTo: textFieldPrice.bottomAnchor,constant: 16),
            textFieldContactInfo.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            textFieldContactInfo.widthAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            buttonSave.topAnchor.constraint(equalTo: textFieldContactInfo.bottomAnchor, constant: 32),
            buttonSave.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            buttonSave.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor, constant: -15),
        
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
