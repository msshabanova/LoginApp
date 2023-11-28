//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Мария Шабанова on 28.11.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(userName ?? "No name")!"
    }
}
