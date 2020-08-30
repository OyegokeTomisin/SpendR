//
//  Collection.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 30/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation

enum Collection: String {
    case users
    case tags

    var identifier: String { rawValue }
}
