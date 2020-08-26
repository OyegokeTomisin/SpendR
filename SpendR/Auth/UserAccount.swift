//
//  UserAccount.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 26/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation

struct UserAccount {
    
    let email: String
    let password: String
    
    init(email: String?, password: String?) throws {
        guard let email = email, email.isValidEmail else { throw UserAccountError.invalidEmail }
        guard let password = password, password.count > 5 else { throw UserAccountError.invalidPassword }
        
        self.email = email
        self.password = password
    }
}
