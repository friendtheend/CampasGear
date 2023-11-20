

import UIKit

class LoginViewController: UIViewController {
    //MARK: instantiating the Notification center...
    let notificationCenter = NotificationCenter.default
    
    //MARK: initializing the Create Contact View...
    let loginScreenView = LoginScreenView()
    
    //MARK: add the view to this controller while the view is loading...
    override func loadView() {
        view = loginScreenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: recognizing the taps on the app screen, not the keyboard...
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        view.addGestureRecognizer(tapRecognizer)
        
        //MARK: add action to SignUP button
        loginScreenView.buttonSignUp.addTarget(self, action: #selector(onButtonSignUpTapped), for: .touchUpInside)
        //MARK: add action to LogIn button
        loginScreenView.buttonLogin.addTarget(self, action: #selector(onButtonLogInTapped), for: .touchUpInside)
        
        //MARK: move the view up, when keyboard shows
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc func onButtonSignUpTapped() {
        let signUpViewController = SignUpViewController()
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    @objc func onButtonLogInTapped() {
        // get Email
        guard let unwrappedEmail = loginScreenView.textFieldEmail.text else {
            showErrorAlert()
            return
        }
        guard !unwrappedEmail.isEmpty else {
            return showErrorAlert(message: "Email is empty!")
        }
        guard isValidEmail(unwrappedEmail) else {
            return showErrorAlert(message: "Invalid email address")
        }
        // get Password
        guard let unwrappedPassword = loginScreenView.textFieldPassword.text else {
            showErrorAlert()
            return
        }
        guard !unwrappedPassword.isEmpty else {
            showErrorAlert(message: "Password is empty!")
            return
        }
        
        APIService.shared.logIn(parameters: LogInParameters(email: unwrappedEmail, password: unwrappedPassword)) { loginResult in
            switch loginResult {
            case .success(let loginResponse):
                print(loginResponse)
                guard let unwrappedToken = loginResponse.token else {
                    return self.showErrorAlert(message: "Empty")
                }
                // store token using userDefault
                UserDefaults.standard.set(unwrappedToken, forKey: "token")
                
                let viewController = ViewController()
                self.navigationController?.setViewControllers([viewController], animated: true)
            
                
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showErrorAlert(message: "\(error.localizedDescription)", title: "Fail")
                }

            }
        }
    }
    
    
    
    //MARK: Hide Keyboard, when tap outside the keyboard
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
    
    // MARK: keyboard Show and Hide event
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y == 0 {
                view.frame.origin.y -= keyboardSize.height / 6
            }
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
    }

    // MARK: Text field check logics
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

}
