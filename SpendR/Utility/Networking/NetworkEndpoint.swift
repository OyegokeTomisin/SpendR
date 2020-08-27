//
//  NetworkEndpoint.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 27/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation
import FirebaseFirestore

protocol NetworkEndpoint {
    var networkTask: NetworkTask { get }
    var documentReference: DocumentReference { get }
    var collectionReference: CollectionReference { get }
}
