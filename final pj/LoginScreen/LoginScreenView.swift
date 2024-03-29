//
//  LoginScreenView.swift
//  final pj
//
//  Created by 林允儿老公专属Mac on 2023/11/21.
//

import UIKit

class LoginScreenView: UIView {

    var imageLogo:UIImageView!
    var titleNotes:UILabel!
    var labelUserName:UILabel!
    var labelPassword:UILabel!
    var textFieldName:UITextField!
    var textFieldPassword:UITextField!
    var registerLabel:UILabel!
    var buttonLogin:UIButton!
    var buttonSignup:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupImageLogo()
        setupTitleNotes()
        setupLabelUserName()
        setupLabelPassword()
        setupTextFieldName()
        setupTextFieldPassword()
        setupRegisterLabel()
        setupButtonLogin()
        setupButtonSignup()
        
        initConstraints()
    }
    
    func setupImageLogo(){
        imageLogo = UIImageView(image: UIImage(named: "Logo"))
        imageLogo.contentMode = .scaleToFill
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageLogo)
    }
    
    func setupTitleNotes(){
        titleNotes = UILabel()
        titleNotes.text = "CampusGear"
        titleNotes.font = UIFont.boldSystemFont(ofSize: 35)
        titleNotes.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleNotes)
    }
    
    func setupLabelUserName(){
        labelUserName = UILabel()
        labelUserName.text = "Email"
        labelUserName.font = UIFont.boldSystemFont(ofSize: 16)
        labelUserName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelUserName)

    }
    func setupLabelPassword(){
        labelPassword = UILabel()
        labelPassword.text = "Password"
        labelPassword.font = UIFont.boldSystemFont(ofSize: 16)
        labelPassword.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPassword)
    }
    func setupTextFieldName(){
        textFieldName = UITextField()
        textFieldName.borderStyle = .roundedRect
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldName)
    }
    func setupTextFieldPassword(){
        textFieldPassword = UITextField()
        textFieldPassword.borderStyle = .roundedRect
        textFieldPassword.isSecureTextEntry = true
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPassword)
    }
    func setupRegisterLabel(){
        registerLabel = UILabel()
        registerLabel.text = "Do not have a account?"
        registerLabel.font = UIFont.boldSystemFont(ofSize: 16)
        registerLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(registerLabel)
    }
    func setupButtonLogin(){
        buttonLogin = UIButton(type: .system)
        buttonLogin.setTitle("Login", for: .normal)
        buttonLogin.titleLabel?.font = .boldSystemFont(ofSize: 23)
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonLogin)
    }
    func setupButtonSignup(){
        buttonSignup = UIButton(type: .system)
        buttonSignup.setTitle("Sign Up", for: .normal)
        buttonSignup.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonSignup.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSignup)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            imageLogo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 28),
            imageLogo.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            imageLogo.widthAnchor.constraint(equalToConstant: 120),
            imageLogo.heightAnchor.constraint(equalToConstant: 120),
            
            titleNotes.topAnchor.constraint(equalTo: imageLogo.bottomAnchor,constant: 10),
            titleNotes.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelUserName.topAnchor.constraint(equalTo: titleNotes.bottomAnchor,constant: 42),
            labelUserName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            
            textFieldName.topAnchor.constraint(equalTo: labelUserName.bottomAnchor),
            textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            textFieldName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            
            labelPassword.topAnchor.constraint(equalTo: textFieldName.bottomAnchor,constant: 26),
            labelPassword.leadingAnchor.constraint(equalTo: labelUserName.leadingAnchor),
            
            textFieldPassword.topAnchor.constraint(equalTo: labelPassword.bottomAnchor),
            textFieldPassword.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            textFieldPassword.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            
            buttonLogin.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor,constant: 43),
            buttonLogin.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            registerLabel.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor,constant: 52),
            registerLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant: 60),
            
            buttonSignup.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor,constant: 46),
            buttonSignup.leadingAnchor.constraint(equalTo: registerLabel.trailingAnchor,constant: 15)
            
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
