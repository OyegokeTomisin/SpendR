//
//  NetworkRouter.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 27/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation

typealias NetworkRouterCompletion = ((Result<Any?, Error>) -> Void)

protocol NetworkRouter: class {
    func request(_ route: NetworkEndpoint, completion: @escaping NetworkRouterCompletion)
}
