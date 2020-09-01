//
//  TransactionTableViewCell.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 01/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with expense: Expense) {
        dateLabel.text = expense.createdAt.dateValue().description
        titleLabel.text = expense.name
        descriptionLabel.text = expense.tag?.name ?? "General"
        amountLabel.text = "$ \(expense.amount)"
    }

    func configure(with bill: Bill){
        dateLabel.text = bill.date.dateValue().description
        titleLabel.text = bill.name
        descriptionLabel.text = bill.name
        amountLabel.text = "$ \(bill.amount)"
    }
}
