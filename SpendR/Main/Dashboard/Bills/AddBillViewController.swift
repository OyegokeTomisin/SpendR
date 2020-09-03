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
    @IBOutlet weak var tagStackView: UIStackView!

    private var tags = [Tag]()
    private var selectedTag: Tag?
    private var selectedDate: Date?
    private var selectedIndexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: TagCollectionViewCell.identifier, bundle: nil)
        tagCollectionView.register(nib, forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
        setDatePickerTextInput()
        fetchTags()
    }

    private func setDatePickerTextInput() {
        let datePicker = UIDatePicker()
        datePicker.minimumDate = Date()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        dateTextField.inputView = datePicker
    }

    @objc private func datePickerValueChanged(sender: UIDatePicker) {
        dateTextField.text = nil
        selectedDate = sender.date
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM, d, yyyy"
        dateTextField.text = formatter.string(from: sender.date)
    }

    @IBAction func createButtonTapped(_ sender: UIButton) {
        guard let name = descriptionTextField.text else { return }
        guard let amount = amountTextField.text, let value = Int(amount) else { return }
        guard let date = selectedDate else { return }
        if let indexpath = selectedIndexPath {
            createBill(name: name, amount: value, date: date, selectedTag: tags[indexpath.item])
        } else {
             createBill(name: name, amount: value, date: date, selectedTag: nil)
        }
    }

    private func fetchTags() {
        let service = TagService(delegate: self)
        HUD.display()
        service.fetchTags()
    }

    private func createBill(name: String, amount: Int, date: Date, selectedTag: Tag?) {
        let bill = Bill(name: name, amount: amount, date: date, tag: selectedTag)
        let service = BillService(delegate: self)
        HUD.display()
        service.create(bill: bill)
    }
}

extension AddBillViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
        UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                TagCollectionViewCell.identifier, for: indexPath) as? TagCollectionViewCell else {
                    return UICollectionViewCell()
            }
            cell.toggleSelectedState()
            cell.descriptionLabel.text = tags[indexPath.item].name
            return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selectedIndexPath = selectedIndexPath {
            let cell = collectionView.cellForItem(at: selectedIndexPath) as? TagCollectionViewCell
            cell?.toggleSelectedState()
        }
        let cell = collectionView.cellForItem(at: indexPath) as? TagCollectionViewCell
        let isAnyCellSelected = selectedIndexPath != nil &&  selectedIndexPath == indexPath
        selectedIndexPath = isAnyCellSelected ? nil : indexPath
        cell?.toggleSelectedState(to: !isAnyCellSelected)
    }
}

extension AddBillViewController: BillServicedelegate {
    func didCompleteRequestWithSuccess(bills: [Bill]?) {
        HUD.dismiss()
        navigationController?.popViewController(animated: true)
    }

    func didCompleteRequestWithFailure(error: String) {
        HUD.dismiss()
        showAlert(title: MessageConstants.errorTitle, message: error)
    }
}

extension AddBillViewController: TagServiceDelegate {
    func didCompleteRequestWithSuccess(tags: [Tag]?) {
        HUD.dismiss()
        if let tags = tags {
            self.tags = tags
            tagStackView.isHidden = tags.isEmpty
            tagCollectionView.reloadData()
        }
    }
}
