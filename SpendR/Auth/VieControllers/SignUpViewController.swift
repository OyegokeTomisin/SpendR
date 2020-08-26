//
//  SignUpViewController.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 26/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction private func signUpButtonTapped(_ sender: Any) {
        do {
            let account = try UserAccount(email: emailTextField.text, password: passwordTextField.text)
            // sign up this account
        } catch let error {
            debugPrint(error)
        }
    }
}
