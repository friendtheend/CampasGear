
import UIKit

class SignUpViewController: UIViewController {
    //MARK: instantiating the Notification center...
    let notificationCenter = NotificationCenter.default
    
    //MARK: initializing the Create Contact View...
    let signUpScreenView = SignUpScreenView()
    
    //MARK: add the view to this controller while the view is loading...
    override func loadView() {
        view = signUpScreenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //MARK: recognizing the taps on the app screen, not the keyboard...
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        view.addGestureRecognizer(tapRecognizer)
        
        //MARK: move the view up, when keyboard shows
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        signUpScreenView.buttonSignUp.addTarget(self, action: #selector(onButtonSignUpTapped), for: .touchUpInside)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
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
    
    
    //MARK: submit button tapped action...
    @objc func onButtonSignUpTapped(){
        // get Name
        guard let unwrappedName = signUpScreenView.textFieldName.text else {
            showErrorAlert()
            return
        }
        guard !unwrappedName.isEmpty else {
            showErrorAlert(message: "Name is empty!")
            return
        }
        // get Email
        guard let unwrappedEmail = signUpScreenView.textFieldEmail.text else {
            showErrorAlert()
            return
        }
        guard !unwrappedEmail.isEmpty else {
            return showErrorAlert(message: "Email is empty!")
        }
        guard isValidEmail(unwrappedEmail) else {
            return showErrorAlert(message: "Invalid email address!")
        }
        // get Password
        guard let unwrappedPassword = signUpScreenView.textFieldPassword.text else {
            showErrorAlert()
            return
        }
        guard !unwrappedPassword.isEmpty else {
            showErrorAlert(message: "password is empty!")
            return
        }
        // get PasswordCheck
        guard let unwrappedPasswordCheck = signUpScreenView.textFieldPassword2.text else {
            showErrorAlert()
            return
        }
        guard !unwrappedPasswordCheck.isEmpty else {
            showErrorAlert(message: "Password is empty!")
            return
        }
        if unwrappedPassword != unwrappedPasswordCheck {
            return showErrorAlert(message: "2 passwords are different, plz check again!")
        }
        
        APIService.shared.signUp(parameters: SignUpParameters(name: unwrappedName, email: unwrappedEmail, password: unwrappedPassword)) { deleteResult in
            switch deleteResult {
            case .success(let data):
                //print(data)
                let alert = UIAlertController( title: "Message", message: "Success", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    self.navigationController?.popViewController(animated: true)
                }))
            
                self.present(alert, animated: true)
                
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showErrorAlert(message: "\(error.localizedDescription) \n Duplicate accounts, plz check again!")
                    
                }

            }
        }
        
    }

    // MARK: Text field check logics
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    func isValidPhoneNum(_ phoneNum: String) -> Bool {
        let phoneRegEx = #"^\(?\d{3}\)?[ -]?\d{3}[ -]?\d{4}$"#
        
        let phonePred = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        return phonePred.evaluate(with: phoneNum)
    }
}
