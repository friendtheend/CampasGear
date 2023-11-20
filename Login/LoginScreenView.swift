
import UIKit

class LoginScreenView: UIView {
    var contentWrapper: UIScrollView!
    var labelTitle: UILabel!
    var textFieldEmail: UITextField!
    var textFieldPassword: UITextField!
    var buttonLogin: UIButton!
    var labelSignUp: UILabel!
    var buttonSignUp: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupContentWrapper()
        setupLabelTitle()
        setupTextFieldEmail()
        setupTextFieldPassword()
        setupButtonLogin()
        setupLabelSignUp()
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
        labelTitle.text = "Login"
        labelTitle.textAlignment = .center
        labelTitle.font = UIFont.systemFont(ofSize: 40)
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelTitle)
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

    func setupButtonLogin() {
        buttonLogin = UIButton(type: .system)
        buttonLogin.titleLabel?.font = .boldSystemFont(ofSize: 25)
        buttonLogin.setTitle("Log In", for: .normal)
        buttonLogin.setTitleColor(.green, for: .normal)
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonLogin)
    }
    
    func setupLabelSignUp() {
        labelSignUp = UILabel()
        labelSignUp.text = "New User ->"
        labelSignUp.font = UIFont.systemFont(ofSize: 18)
        labelSignUp.textAlignment = .left
        labelSignUp.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelSignUp)
    }
    
    func setupButtonSignUp() {
        buttonSignUp = UIButton(type: .system)
        buttonSignUp.titleLabel?.font = .boldSystemFont(ofSize: 18)
        buttonSignUp.setTitle("Sign Up", for: .normal)
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
            
            textFieldEmail.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 40),
            textFieldEmail.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 32),
            textFieldEmail.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -32),
            textFieldEmail.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),

            textFieldPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 25),
            textFieldPassword.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 32),
            textFieldPassword.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -32),
        
            buttonLogin.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 32),
            buttonLogin.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            labelSignUp.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: 32),
            labelSignUp.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor, constant: -32),
            
            buttonSignUp.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: 32),
            buttonSignUp.leadingAnchor.constraint(equalTo: labelSignUp.trailingAnchor, constant: 16),
            buttonSignUp.centerYAnchor.constraint(equalTo: labelSignUp.centerYAnchor),
            buttonSignUp.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) implement")
    }
}
