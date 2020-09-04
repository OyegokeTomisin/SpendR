//
//  UITextField+Extension.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 04/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import UIKit

extension UITextField {
    @discardableResult
    func currencyFormat() -> Int? {
        let strippedAmount = text?.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        guard let value = strippedAmount, let amount = Double(value) else { return nil }
        let decimalAmount = amount / 100
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        text = formatter.string(from: NSNumber(value: decimalAmount))
        return Int(value)
    }
}
