//
//  Storyboard.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 27/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation

enum Storyboard: String {
    case auth
    case main
    
    var identifier: String {
        return rawValue.capitalized
    }
}
