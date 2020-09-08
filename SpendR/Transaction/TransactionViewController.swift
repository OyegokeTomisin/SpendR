//
//  TransactionViewController.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 01/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import UIKit

typealias TransactionServiceDelegate = ExpenseServiceDelegate & BillServiceDelegate

class TransactionViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!

    private var transaction: Transaction = .expense
    private var expenseService: ExpenseService?
    private var billService: BillService?
    private var expenses = [Expense]()
    private var bills = [Bill]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        loadExpenseService()
    }

    private func setupTableView() {
        let nib = UINib(nibName: TransactionTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: TransactionTableViewCell.identifier)
        tableView.tableFooterView = UIView()
    }

    private func loadExpenseService() {
        expenseService = ExpenseService(delegate: self)
        HUD.display()
        expenseService?.fetchExpenses()
    }

    private func loadBillService() {
        billService = BillService(delegate: self)
        HUD.display()
        billService?.fetchBills()
    }

    func deleteTransaction(at row: Int) {
        switch transaction {
        case .expense:
            if let id = expenses[row].id {
                HUD.display()
                expenseService?.deleteExpense(with: id)
            }
        case .bills:
            if let id = bills[row].id {
                HUD.display()
                billService?.deleteBill(with: id)
            }
        }
    }

    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        transaction = sender.selectedSegmentIndex == 0 ? .expense : .bills
        switch transaction {
        case .expense:
            expenseService == nil ? loadExpenseService() : tableView.reloadData()
        case .bills:
            billService == nil ? loadBillService() : tableView.reloadData()
        }
    }
}

extension TransactionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transaction == .expense ? expenses.count : bills.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TransactionTableViewCell.identifier)
        guard let transactionCell = cell as? TransactionTableViewCell else { return UITableViewCell() }
        transaction == .expense ?
            transactionCell.configure(with: expenses[indexPath.row]) :
            transactionCell.configure(with: bills[indexPath.row])
        return transactionCell
    }
}

extension TransactionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        editingStyle == .delete ? deleteTransaction(at: indexPath.row) : nil
    }
}

extension TransactionViewController: TransactionServiceDelegate {
    func didCompleteRequestWithSuccess(expenses: [Expense]?) {
        HUD.dismiss()
        if let expenses = expenses {
            self.expenses = expenses.sorted { $0.createdAt.dateValue() > $1.createdAt.dateValue() }
            tableView.reloadData()
        }
    }

    func didCompleteRequestWithFailure(error: String) {
        HUD.dismiss()
        showAlert(title: MessageConstants.errorTitle, message: error)
    }

    func didCompleteRequestWithSuccess(bills: [Bill]?) {
        HUD.dismiss()
        if let bills = bills {
            self.bills = bills.sorted { $0.date.dateValue() < $1.date.dateValue() }
            tableView.reloadData()
        }
    }
}
