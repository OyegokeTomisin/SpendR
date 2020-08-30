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
        case .create(let data):
            create(data, route: route, completion: completion)
        case .read:
            read(route: route, completion: completion)
        case .update(let data):
            update(data, route: route, completion: completion)
        case .delete:
            delete(route: route, completion: completion)
        }
    }

    private func create(_ data: Parameter, route: NetworkEndpoint, completion: @escaping NetworkRouterCompletion) {
        if let documentReference = route.documentReference {
            documentReference.setData(data) { error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(nil))
                }
            }
        } else {
            completion(.failure(EndpointError.incompleteTask))
        }
    }

    private func read(route: NetworkEndpoint, completion: @escaping NetworkRouterCompletion) {
        if let collectionReference = route.collectionReference {
            collectionReference.addSnapshotListener { (querySnapshot, error) in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(querySnapshot))
                }
            }
        } else {
            completion(.failure(EndpointError.incompleteTask))
        }
    }

    private func update(_ data: Parameter, route: NetworkEndpoint, completion: @escaping NetworkRouterCompletion) {
        if let documentReference = route.documentReference {
            documentReference.updateData(data) { error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(nil))
                }
            }
        } else {
            completion(.failure(EndpointError.incompleteTask))
        }
    }

    private func delete(route: NetworkEndpoint, completion: @escaping NetworkRouterCompletion) {
        if let documentReference = route.documentReference {
            documentReference.delete { error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(nil))
                }
            }
        } else {
            completion(.failure(EndpointError.incompleteTask))
        }
    }
}
