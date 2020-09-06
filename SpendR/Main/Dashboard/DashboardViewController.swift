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

    private var recent = [Expense]()
    private var topTags = [Tag]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        let service = DashboardAnalytics()
        service.delegate = self
        service.load()
    }

    private func setupTableView() {
        let nib = UINib(nibName: TransactionTableViewCell.identifier, bundle: nil)
        transactionTableView.register(nib, forCellReuseIdentifier: TransactionTableViewCell.identifier)
        transactionTableView.tableFooterView = UIView()
    }
}

extension DashboardViewController: DashboardAnalyticsDelegate {

    func didUpdateTotal(billCount: Int) {
        upcomingBillsLabel.text = "\(billCount)"
    }

    func didUpdateExpense(spendCount: Int, recent: [Expense], topTag: TopTagSpend) {
        topSpendLabel.text = spendCount.currencyFormat()

        displayTopTagSpend(topTag)
        self.recent = recent
        transactionTableView.reloadData()
    }

    private func displayTopTagSpend(_ data: TopTagSpend) {
        topTagDescription_01.text = data.first?.name ?? "--"
        topTagAmount_01.text = data.first?.amount.currencyFormat() ?? "--"

        topTagDescription_02.text = data.second?.name ?? "--"
        topTagAmount_02.text = data.second?.amount.currencyFormat() ?? "--"

        topTagDescription_03.text = data.third?.name ?? "--"
        topTagAmount_03.text = data.third?.amount.currencyFormat() ?? "--"
    }
}

extension DashboardViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recent.prefix(2).count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:
            TransactionTableViewCell.identifier, for: indexPath) as? TransactionTableViewCell else {
                return UITableViewCell() }
        cell.configure(with: recent[indexPath.row])
        return cell
    }
}
