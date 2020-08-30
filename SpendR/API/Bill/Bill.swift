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
}

extension Bill: EndpointData {
    var asParameter: Parameter {
        return [ParamConstant.name.key: name, ParamConstant.date.key: date, ParamConstant.amount.key: amount]
    }
}
