//
//  UserAccountError.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 26/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation

enum UserAccountError: String, Error, LocalizedError {
    case invalidEmail = "Email is not valid"
    case invalidPassword = "Password is not valid"

    var errorDescription: String? {
        return NSLocalizedString(rawValue, comment: "User Account Error")
    }
}
