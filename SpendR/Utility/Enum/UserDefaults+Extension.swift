//
//  UserDefaults+Extension.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 03/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation
import FirebaseAuth

extension UserDefaults {

    var userEmail: String? {
        return Auth.auth().currentUser?.email
    }
}
