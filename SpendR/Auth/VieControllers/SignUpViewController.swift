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
            let task = AuthService(delegate: self)
            task.createUser(with: account)
            HUD.display()
        } catch let error {
            didCompleteRequestWithfailure(error: error)
        }
    }
}

extension SignUpViewController: AuthRequestServiceDelegate {
    func didCompleteRequestWithSuccess() {
        HUD.dismiss()
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.changeRootViewController(to: Storyboard.main, with: ViewController.identifier)
    }
    
    func didCompleteRequestWithfailure(error: Error) {
        HUD.dismiss()
        showAlert(title: MessageConstants.errorTitle, message: error.localizedDescription)
    }
}
