//
//  Tag.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 30/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift

struct Tag: Codable {
    @DocumentID var id: String?
    var name: String
    var amount: Int 
}

extension Tag: EndpointData {
    var asParameter: Parameter {
        return [ParamConstant.name.key: name, ParamConstant.amount.key: amount]
    }
}
