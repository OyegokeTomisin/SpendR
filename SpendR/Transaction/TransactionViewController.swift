//
//  TransactionViewController.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 01/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import UIKit

class TransactionViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!

    private var transaction: Transaction = .expense

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        transaction = sender.selectedSegmentIndex == 0 ? .expense : .bills
        tableView.reloadData()
    }

    private func setupTableView() {
        let nib = UINib(nibName: TransactionTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: TransactionTableViewCell.identifier)
        tableView.tableFooterView = UIView()
    }
}

extension TransactionViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transaction == .expense ? 5 : 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TransactionTableViewCell.identifier)
        guard let transactionCell = cell as? TransactionTableViewCell else { return UITableViewCell() }
        transaction == .expense ?
            transactionCell.configure(with: Expense(name: "Expense", amount: 40)) :
            transactionCell.configure(with: Bill(name: "Bill", amount: 300, date: Date()))
        return transactionCell
    }
}

extension TransactionViewController: UITableViewDelegate {

}
