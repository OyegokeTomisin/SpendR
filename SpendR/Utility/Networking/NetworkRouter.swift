//
//  NetworkRouter.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 27/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation

protocol NetworkRouter: AnyObject {
    associatedtype Endpoint: NetworkEndpoint
    func request(_ route: Endpoint, completion: @escaping NetworkRouterCompletion)
}
