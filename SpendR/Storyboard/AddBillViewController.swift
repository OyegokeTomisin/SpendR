//
//  AddBillViewController.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 31/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import UIKit

class AddBillViewController: UIViewController {

    @IBOutlet weak var tagCollectionView: UICollectionView!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!

    private var selectedDate: Date?

    override func viewDidLoad() {
        super.viewDidLoad()
        setDatePickerTextInput()
    }

    private func setDatePickerTextInput() {
        let datePicker = UIDatePicker()
        datePicker.minimumDate = Date()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        dateTextField.inputView = datePicker
    }

    @objc private func datePickerValueChanged(sender: UIDatePicker) {
        dateTextField = nil
        selectedDate = sender.date
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM, d, yyyy"
        dateTextField.text = formatter.string(from: sender.date)
    }

    @IBAction func createButtonTapped(_ sender: UIButton) {
        guard let name = descriptionTextField.text else { return }
        guard let amount = amountTextField.text, let value = Int(amount) else { return }
        guard let date = selectedDate else { return }
        createBill(name: name, amount: value, date: date)
    }

    private func createBill(name: String, amount: Int, date: Date) {
        let bill = Bill(name: name, amount: amount, date: date)
        let service = BillService(delegate: self)
        service.create(bill: bill)
        HUD.display()
    }
}

extension AddBillViewController: BillServicedelegate {
    func didCompleteRequestWithSuccess(bills: [Bill]?) {
        HUD.dismiss()
        debugPrint(bills ?? "bill is nil")
    }

    func didCompleteRequestWithFailure(error: String) {
        HUD.dismiss()
        showAlert(title: MessageConstants.errorTitle, message: error)
    }
}
