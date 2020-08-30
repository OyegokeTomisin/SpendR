//
//  NetworkEndpoint.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 27/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation
import FirebaseFirestore

typealias NetworkRouterCompletion = ((Result<QuerySnapshot?, Error>) -> Void)

protocol NetworkEndpoint {
    var networkTask: NetworkTask { get }
    var baseDocumentReference: DocumentReference? { get }
    var documentReference: DocumentReference? { get }
    var collectionReference: CollectionReference? { get }
}
