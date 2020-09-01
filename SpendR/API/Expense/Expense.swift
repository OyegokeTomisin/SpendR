//
//  Expense.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 31/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Expense: Codable {
    @DocumentID var id: String?
    var name: String
    var amount: Int
    var createdAt: Timestamp
    var tag: Tag?
    
    init(name: String, amount: Int, tag: Tag? = nil) {
        self.name = name
        self.amount = amount
        self.tag = tag
        self.createdAt = Timestamp(date: Date())
    }
}

extension Expense: EndpointData {
    var asParameter: Parameter {
        var parameter: Parameter = [ParamConstant.name.key: name,
                                    ParamConstant.amount.key: amount, ParamConstant.createdAt.key: createdAt]
        if let tag = tag { parameter[ParamConstant.tag.key] = tag.asParameter }
        return parameter
    }
}
