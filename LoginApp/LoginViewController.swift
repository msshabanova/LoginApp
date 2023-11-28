//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Мария Шабанова on 28.11.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var logInButton: UIButton!
    
    private let userName = "User"
    private let password = "Password"

    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 10
        userNameTextField.layer.cornerRadius = 10
        passwordTextField.layer.cornerRadius = 10
        
        self.hideKeyboardWhenTappedAround()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTextField.text == userName, passwordTextField.text == password else {
            showAlert(with: "Invalid login or password", and: "Please, enter correct login or password")
            return false
        }
        
        // Введенное имя валидно, разрешаем переход
        return true
    }

    
    @IBAction func showUserName() {
        showAlert(with: "Ops", and: "Your name is \(userName)")
    }
    
    @IBAction func showPassword() {
        showAlert(with: "Ops", and: "Your password is \(password)")
    }
    
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
