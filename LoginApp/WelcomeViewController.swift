//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Мария Шабанова on 28.11.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var logOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logOut() {
        dismiss(animated: true)
    }
}
