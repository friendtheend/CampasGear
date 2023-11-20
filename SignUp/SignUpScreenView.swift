

import UIKit

class SignUpScreenView: UIView {
    var contentWrapper: UIScrollView!
    var labelTitle: UILabel!
    var textFieldName: UITextField!
    var textFieldEmail: UITextField!
    var textFieldPassword: UITextField!
    var textFieldPassword2: UITextField!
    var buttonSignUp: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: set the background color
        self.backgroundColor = .white
        
        //MARK: initializing the UI elements and constraints
        setupContentWrapper()
        setupLabelTitle()
        setupTextFieldName()
        setupTextFieldEmail()
        setupTextFieldPassword()
        setupTextFieldPassword2()
        setupButtonSignUp()
        
        initConstraints()
    }
    
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    func setupLabelTitle() {
        labelTitle = UILabel()
        labelTitle.text = "Create an account"
        labelTitle.textAlignment = .center
        labelTitle.font = UIFont.systemFont(ofSize: 23)
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelTitle)
    }
    
    func setupTextFieldName(){
        textFieldName = UITextField()
        textFieldName.placeholder = "Name"
        textFieldName.borderStyle = .roundedRect
        textFieldName.keyboardType = .emailAddress
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldName)
    }

    func setupTextFieldEmail(){
        textFieldEmail = UITextField()
        textFieldEmail.placeholder = "Email"
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.keyboardType = .emailAddress
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldEmail)
    }
    
    func setupTextFieldPassword(){
        textFieldPassword = UITextField()
        textFieldPassword.placeholder = "Password"
        textFieldPassword.borderStyle = .roundedRect
        textFieldPassword.keyboardType = .default
        textFieldPassword.isSecureTextEntry = true
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldPassword)
    }
    
    func setupTextFieldPassword2(){
        textFieldPassword2 = UITextField()
        textFieldPassword2.placeholder = "Enter the password again"
        textFieldPassword2.borderStyle = .roundedRect
        textFieldPassword2.keyboardType = .default
        textFieldPassword2.isSecureTextEntry = true
        textFieldPassword2.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldPassword2)
    }

    func setupButtonSignUp() {
        buttonSignUp = UIButton(type: .system)
        buttonSignUp.titleLabel?.font = .boldSystemFont(ofSize: 25)
        buttonSignUp.setTitle("Sign Up", for: .normal)
        buttonSignUp.setTitleColor(.green, for: .normal)

        buttonSignUp.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonSignUp)
    }
    

    func initConstraints(){
        
        NSLayoutConstraint.activate([
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            labelTitle.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 32),
            labelTitle.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),

            textFieldName.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 30),
            textFieldName.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 32),
            textFieldName.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -32),
            textFieldName.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            textFieldEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 16),
            textFieldEmail.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 32),
            textFieldEmail.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -32),
            textFieldEmail.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),

            textFieldPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 16),
            textFieldPassword.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 32),
            textFieldPassword.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -32),
            
            textFieldPassword2.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 16),
            textFieldPassword2.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 32),
            textFieldPassword2.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -32),
            
            buttonSignUp.topAnchor.constraint(equalTo: textFieldPassword2.bottomAnchor, constant: 45),
            buttonSignUp.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            buttonSignUp.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor),
        ])
    }


    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) implement")
    }

}
