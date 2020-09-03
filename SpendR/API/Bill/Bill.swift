//
//  Bill.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 31/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Bill: Codable {
    @DocumentID var id: String?
    var name: String
    var date: Timestamp
    var amount: Int
    var tag: Tag?

    init(name: String, amount: Int, date: Date, tag: Tag?) {
        self.name = name
        self.amount = amount
        self.tag = tag
        self.date = Timestamp(date: date)
    }
}

extension Bill: EndpointData {
    var asParameter: Parameter {
        return [ParamConstant.name.key: name, ParamConstant.date.key: date, ParamConstant.amount.key: amount]
    }
}
