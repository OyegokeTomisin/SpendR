//
//  LoginViewController.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 26/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {


    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction private func loginButtonTapped(_ sender: Any) {
        do {
            let account = try UserAccount(email: emailTextField.text, password: passwordTextField.text)
            // login this account
        } catch let error {
            debugPrint(error)
        }
    }
}
