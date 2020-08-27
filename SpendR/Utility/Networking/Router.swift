//
//  Router.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 27/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation

class Router<Endpoint: NetworkEndpoint>: NetworkRouter {
    
    func request(_ route: NetworkEndpoint, completion: @escaping NetworkRouterCompletion) {
        switch route.networkTask {
        case .create:
            create()
        case .read:
            read()
        case .update:
            update()
        case .delete:
            delete()
        }
    }
    
    private func create() {
        
    }
    
    private func read() {
        
    }
    
    private func update() {
        
    }
    
    private func delete() {
        
    }
}
