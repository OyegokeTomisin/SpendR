//
//  ProfileViewController.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 03/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        emailLabel.text = UserDefaults.standard.userEmail
    }
    
    @IBAction func didSelectTagSettings(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: TagViewController.identifier, sender: self)
    }

    @IBAction func didSelectLogout(_ sender: UITapGestureRecognizer) {
        let logutAlert = UIAlertController(title: MessageConstants.logoutTitle,
                                      message: MessageConstants.confirmLogout, preferredStyle: .actionSheet)
        let cancel_action = UIAlertAction(title: MessageConstants.cancel, style: .cancel, handler: nil)
        let logout_action = UIAlertAction(title: MessageConstants.logoutTitle, style: .destructive, handler: { _ in
            self.logoutUser()
        })
        logutAlert.addAction(cancel_action)
        logutAlert.addAction(logout_action)
        present(logutAlert, animated: true, completion: nil)
    }

    private func logoutUser() {
        let service = AuthService()
        service.logutUserAccount { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success:
                self.changeRootWindow()
            case .failure(let error):
                self.showAlert(title: MessageConstants.errorTitle, message: error.localizedDescription)
            }
        }
    }

    private func changeRootWindow() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.changeRootViewController(to: Storyboard.auth, with: AuthRootViewController.identifier)
    }
}
