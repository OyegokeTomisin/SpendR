//
//  Date+Extension.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 04/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation

extension Date {

    enum TransactionDateFormat: String {
        case creation = "d MMM yyyy"
        case dueDate = "EEEE, d MMM"

        var identifier: String { rawValue }
    }

    func displayDate(in formatStyle: TransactionDateFormat) -> String? {
        return formatDate(in: formatStyle).string(from: self)
    }

    private func formatDate(in dateFormat: TransactionDateFormat) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat.identifier
        return formatter
    }
}
