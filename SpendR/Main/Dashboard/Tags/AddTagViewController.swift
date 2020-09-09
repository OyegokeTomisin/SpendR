//
//  AddTagViewController.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 31/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import UIKit

class AddTagViewController: UIViewController {

    @IBOutlet weak var descriptionTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func createButtonTapped(_ sender: Any) {
        guard let name = descriptionTextField.text else { return }
        createTag(with: name)
    }

    private func createTag(with name: String) {
        let tag = Tag(name: name)
        let service = TagService(delegate: self)
        HUD.display()
        service.create(tag: tag)
    }
}

extension AddTagViewController: TagServiceDelegate {
    func didCompleteRequestWithSuccess(tags: [Tag]?) {
        showAlert(title: MessageConstants.success, message: MessageConstants.tagCreated) {
            HUD.dismiss()
            self.navigationController?.popViewController(animated: true)
        }
    }

    func didCompleteRequestWithFailure(error: String) {
        HUD.dismiss()
        showAlert(title: MessageConstants.errorTitle, message: error)
    }
}
