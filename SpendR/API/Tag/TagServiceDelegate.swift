//
//  TagServiceDelegate.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 01/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation

protocol TagServiceDelegate: class {
    func didCompleteRequestWithSuccess(tags: [Tag]?)
    func didCompleteRequestWithFailure(error: String)
}
