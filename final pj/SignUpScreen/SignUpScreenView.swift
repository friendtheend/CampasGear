//
//  SignUpScreenView.swift
//  final pj
//
//  Created by 林允儿老公专属Mac on 2023/11/21.
//

import UIKit

class SignUpScreenView: UIView {
    
    var contentWrapper: UIScrollView! //new
    
    var buttonTakePhoto: UIButton!
    var textFieldUserName: UITextField!
    var textFieldPassword: UITextField!
    var textFieldVerifyPassword:UITextField!
    var labelSelectSchool: UILabel!
    var pickerViewSchool:UIPickerView!
    var textFieldEmail: UITextField!
    var textFieldPhone: UITextField!
    var textFieldAddress: UITextField!
    var buttonRegister: UIButton!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white

        setupContentWrapper()
        setupButtonTakePhoto()
        setuptextFieldName()
        setuptextFieldEmail()
        setupTextFieldPassword()
        setupButtonRegister()
        setupTextFieldVerifyPassword()
        setuptextFieldAddress()
        setuptextFieldPhone()
        setupLabelSchool()
        setupPickerViewSchool()
        
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
        buttonTakePhoto.setImage(UIImage(systemName: "person.fill"), for: .normal)
        buttonTakePhoto.contentHorizontalAlignment = .fill
        buttonTakePhoto.contentVerticalAlignment = .fill
        buttonTakePhoto.imageView?.contentMode = .scaleToFill
        buttonTakePhoto.showsMenuAsPrimaryAction = true
        buttonTakePhoto.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonTakePhoto)
    }
    
    func setuptextFieldName(){
        textFieldUserName = UITextField()
        textFieldUserName.placeholder = "Username"
        textFieldUserName.keyboardType = .default
        textFieldUserName.borderStyle = .roundedRect
        textFieldUserName.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldUserName)
    }
    
    func setupLabelSchool() {
        labelSelectSchool = UILabel()
        labelSelectSchool.text = "Select a School"
        labelSelectSchool.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelSelectSchool)
    }
    
    func setupPickerViewSchool(){
        pickerViewSchool = UIPickerView()
        pickerViewSchool.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(pickerViewSchool)
    }
    
    func setuptextFieldPhone(){
        textFieldPhone = UITextField()
        textFieldPhone.placeholder = "Phone"
        textFieldPhone.keyboardType = .default
        textFieldPhone.borderStyle = .roundedRect
        textFieldPhone.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldPhone)
    }
    
    func setuptextFieldEmail(){
        textFieldEmail = UITextField()
        textFieldEmail.placeholder = "Email"
        textFieldEmail.keyboardType = .emailAddress
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldEmail)
    }
    
    func setuptextFieldAddress(){
        textFieldAddress = UITextField()
        textFieldAddress.placeholder = "Address"
        textFieldAddress.keyboardType = .emailAddress
        textFieldAddress.borderStyle = .roundedRect
        textFieldAddress.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldAddress)
    }
    
    func setupTextFieldPassword(){
        textFieldPassword = UITextField()
        textFieldPassword.placeholder = "Password"
        textFieldPassword.isSecureTextEntry = true
        textFieldPassword.borderStyle = .roundedRect
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldPassword)
    }
    
    func setupTextFieldVerifyPassword(){
        textFieldVerifyPassword = UITextField()
        textFieldVerifyPassword.borderStyle = .roundedRect
//        textFieldVerifyPassword.textContentType = .password
        textFieldVerifyPassword.isSecureTextEntry = true
        textFieldVerifyPassword.placeholder = "Repeat Enter Password "
        textFieldVerifyPassword.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldVerifyPassword)
    }
    
    func setupButtonRegister(){
        buttonRegister = UIButton(type: .system)
        buttonRegister.setTitle("Register", for: .normal)
        buttonRegister.titleLabel?.font = .boldSystemFont(ofSize: 21)
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonRegister)
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
            
            textFieldUserName.topAnchor.constraint(equalTo: buttonTakePhoto.bottomAnchor, constant: 32),
            textFieldUserName.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            textFieldUserName.widthAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            textFieldPassword.topAnchor.constraint(equalTo: textFieldUserName.bottomAnchor, constant: 16),
            textFieldPassword.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            textFieldPassword.widthAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            textFieldVerifyPassword.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor,constant: 16),
            textFieldVerifyPassword.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            textFieldVerifyPassword.widthAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            labelSelectSchool.topAnchor.constraint(equalTo: textFieldVerifyPassword.bottomAnchor, constant: 16),
            labelSelectSchool.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            labelSelectSchool.widthAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            pickerViewSchool.topAnchor.constraint(equalTo: labelSelectSchool.bottomAnchor, constant: -5),
            pickerViewSchool.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            pickerViewSchool.widthAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),

            textFieldEmail.topAnchor.constraint(equalTo: 
                pickerViewSchool.bottomAnchor, constant: -5),
            textFieldEmail.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            textFieldEmail.widthAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            textFieldPhone.topAnchor.constraint(equalTo:
                textFieldEmail.bottomAnchor, constant: 16),
            textFieldPhone.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            textFieldPhone.widthAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            textFieldAddress.topAnchor.constraint(equalTo: 
                textFieldPhone.bottomAnchor, constant: 16),
            textFieldAddress.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            textFieldAddress.widthAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            buttonRegister.topAnchor.constraint(equalTo:
                textFieldAddress.bottomAnchor, constant: 32),
            buttonRegister.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            buttonRegister.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor, constant: -15),
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
