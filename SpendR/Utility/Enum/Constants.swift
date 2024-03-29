//
//  Constants.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 27/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation

enum MessageConstants {
    static let errorTitle = "Oops!!"
    static let okay = "Okay"
    static let cancel = "Cancel"
    static let logoutTitle = "Logout"
    static let confirmLogout = "Are you sure you want to logout?"
    static let general = "General"
    static let success = "Success!!"
    static let tagCreated = "Your new tag has been added"
    static let billCreated = "Your bill reminder has been added "
    static let expenseCreated = "New expense has been added to your history"
}

enum ParamConstant: String {
    case date
    case name
    case amount
    case createdAt
    case tag
    
    var key: String { rawValue }
}
