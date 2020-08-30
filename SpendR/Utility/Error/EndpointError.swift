//
//  EndpointError.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 30/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation

enum EndpointError: String, Error, LocalizedError {
    case incompleteTask = "Could not complete requested task"

    var errorDescription: String? {
        return NSLocalizedString(rawValue, comment: "Endpoint Error")
    }
}
