//
//  NetworkTask.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 27/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation

typealias Parameter = [String: Any]

enum NetworkTask {
    case create(data: Parameter)
    case update(data: Parameter)
    case read
    case delete
}
