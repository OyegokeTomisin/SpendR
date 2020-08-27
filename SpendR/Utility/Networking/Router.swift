//
//  Router.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 27/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift

class Router<Endpoint: NetworkEndpoint>: NetworkRouter {

    func request(_ route: NetworkEndpoint, completion: @escaping NetworkRouterCompletion) {
        switch route.networkTask {
        case .create:
            create(route: route, completion: completion)
        case .read:
            read(route: route, completion: completion)
        case .update:
            update(route: route, completion: completion)
        case .delete:
            delete(route: route, completion: completion)
        }
    }

    private func create(route: NetworkEndpoint, completion: @escaping NetworkRouterCompletion) {
        route.documentReference.setData([:]) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(nil))
            }
        }
    }

    private func read(route: NetworkEndpoint, completion: @escaping NetworkRouterCompletion) {
        route.collectionReference.addSnapshotListener { (querySnapshot, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(querySnapshot))
            }
        }
    }

    private func update(route: NetworkEndpoint, completion: @escaping NetworkRouterCompletion) {
        route.documentReference.updateData([:]) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(nil))
            }
        }
    }

    private func delete(route: NetworkEndpoint, completion: @escaping NetworkRouterCompletion) {
        route.documentReference.delete { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(nil))
            }
        }
    }
}
