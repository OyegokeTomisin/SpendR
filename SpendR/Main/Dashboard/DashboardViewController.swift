//
//  DashboardViewController.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 06/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var topSpendLabel: UILabel!
    @IBOutlet weak var topTagAmount_01: UILabel!
    @IBOutlet weak var topTagAmount_02: UILabel!
    @IBOutlet weak var topTagAmount_03: UILabel!
    @IBOutlet weak var upcomingBillsLabel: UILabel!
    @IBOutlet weak var topTagDescription_01: UILabel!
    @IBOutlet weak var topTagDescription_02: UILabel!
    @IBOutlet weak var topTagDescription_03: UILabel!
    @IBOutlet weak var transactionTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        let nib = UINib(nibName: TransactionTableViewCell.identifier, bundle: nil)
        transactionTableView.register(nib, forCellReuseIdentifier: TransactionTableViewCell.identifier)
        transactionTableView.tableFooterView = UIView()
    }
}

extension DashboardViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:
            TransactionTableViewCell.identifier, for: indexPath) as? TransactionTableViewCell else {
                return UITableViewCell() }
        return cell
    }
}
