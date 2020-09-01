//
//  AddExpenseViewController.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 31/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import UIKit

class AddExpenseViewController: UIViewController {

    @IBOutlet weak var descriptiontTextField: UITextField!
    @IBOutlet weak var tagCollectionView: UICollectionView!
    @IBOutlet weak var amountTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func createExpense(with name: String, amount value: Int) {
        let expense = Expense(name: name, amount: value, tag: nil)
        let service = ExpenseService(delegate: self)
        service.create(expense: expense)
    }

    @IBAction func createButtonTapped(_ sender: Any) {
        guard let name = descriptiontTextField.text else { return }
        guard let amount = amountTextField.text, let value = Int(amount) else { return }
        createExpense(with: name, amount: value)
        HUD.display()
    }
}

extension AddExpenseViewController: ExpenseServiceDelegate {
    func didCompleteRequestWithSuccess(expenses: [Expense]?) {
        HUD.dismiss()
        debugPrint(expenses ?? "expense is nil")
    }

    func didCompleteRequestWithFailure(error: String) {
        HUD.dismiss()
        showAlert(title: MessageConstants.errorTitle, message: error)
    }
}
