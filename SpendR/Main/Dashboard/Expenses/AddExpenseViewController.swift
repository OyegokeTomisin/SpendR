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
    @IBOutlet weak var tagStackView: UIStackView!

    private var tags = [Tag]()
    private var selectedTag: Tag?
    private var selectedIndexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: TagCollectionViewCell.identifier, bundle: nil)
        tagCollectionView.register(nib, forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
        fetchTags()
    }

    private func fetchTags() {
        let service = TagService(delegate: self)
        HUD.display()
        service.fetchTags()
    }

    private func createExpense(with name: String, amount value: Int, selectedTag: Tag?) {
        let expense = Expense(name: name, amount: value, tag: selectedTag)
        let service = ExpenseService(delegate: self)
        HUD.display()
        service.create(expense: expense)
    }

    @IBAction func amountValueChanged(_ sender: UITextField) {
        sender.currencyFormat()
    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
        guard let name = descriptiontTextField.text else { return }
        guard let amount = amountTextField.currencyFormat() else { return }
        if let indexpath = selectedIndexPath {
            createExpense(with: name, amount: amount, selectedTag: tags[indexpath.item])
        } else {
            createExpense(with: name, amount: amount, selectedTag: nil)
        }
    }
}

extension AddExpenseViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
        UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                TagCollectionViewCell.identifier, for: indexPath) as? TagCollectionViewCell else {
                    return UICollectionViewCell()
            }
            cell.descriptionLabel.text = tags[indexPath.item].name
            cell.toggleSelectedState()
            return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selectedIndexPath = selectedIndexPath,
            let cell = collectionView.cellForItem(at: selectedIndexPath) as? TagCollectionViewCell {
            cell.toggleSelectedState()
        }
        let cell = collectionView.cellForItem(at: indexPath) as? TagCollectionViewCell
        let isAnyCellSelected = selectedIndexPath != nil && selectedIndexPath == indexPath
        selectedIndexPath = isAnyCellSelected ? nil : indexPath
        cell?.toggleSelectedState(to: !isAnyCellSelected)
    }
}

extension AddExpenseViewController: ExpenseServiceDelegate {
    func didCompleteRequestWithSuccess(expenses: [Expense]?) {
        showAlert(title: MessageConstants.success, message: MessageConstants.expenseCreated) {
            HUD.dismiss()
            self.navigationController?.popViewController(animated: true)
        }
    }

    func didCompleteRequestWithFailure(error: String) {
        HUD.dismiss()
        showAlert(title: MessageConstants.errorTitle, message: error)
    }
}

extension AddExpenseViewController: TagServiceDelegate {
    func didCompleteRequestWithSuccess(tags: [Tag]?) {
        HUD.dismiss()
        if let tags = tags {
            self.tags = tags
            tagStackView.isHidden = tags.isEmpty
            tagCollectionView.reloadData()
        }
    }
}
