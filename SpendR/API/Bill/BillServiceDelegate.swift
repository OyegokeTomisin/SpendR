//
//  BillServiceDelegate.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 01/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation

protocol BillServicedelegate: class {
    func didCompleteRequestWithSuccess(bills: [Bill]?)
    func didCompleteRequestWithFailure(error: String)
}
