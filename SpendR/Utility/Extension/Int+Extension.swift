//
//  Int+Extension.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 04/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation

extension Int {
    func currencyFormat() -> String? {
        let amount = Double(self)
        let decimalAmount = amount / 100
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter.string(from: NSNumber(value: decimalAmount))
    }
}
