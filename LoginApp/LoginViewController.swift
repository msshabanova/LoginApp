//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Мария Шабанова on 28.11.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var logInButton: UIButton!
    
    //MARK: - Private properties
    private let userName = "User"
    private let password = "Password"
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 10
        userNameTextField.layer.cornerRadius = 10
        passwordTextField.layer.cornerRadius = 10
    }
    
    //MARK: - IBActions
    @IBAction func showUserName() {
        showAlert(with: "Ops", and: "Your name is \(userName)")
    }
    
    @IBAction func showPassword() {
        showAlert(with: "Ops", and: "Your password is \(password)")
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        self.userNameTextField.text = ""
        self.passwordTextField.text = ""
    }
    
    //MARK: - Methods
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTextField.text == userName, passwordTextField.text == password else {
            showAlert(with: "Invalid login or password", and: "Please, enter correct login or password")
            return false
        }

        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as? WelcomeViewController
        welcomeVC?.userName = userName
    }
}
