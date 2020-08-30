//
//  BillAPI.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 31/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

enum BillAPI: NetworkEndpoint {
    case fetchBills
    case createbill(bill: EndpointData)
    case deleteBill(billId: String)
    
    var networkTask: NetworkTask {
        switch self {
        case .createbill(let data):
            return .create(data: data.asParameter)
        case .fetchBills:
            return .read
        case .deleteBill:
            return .delete
        }
    }
    
    var baseDocumentReference: DocumentReference? {
        if let user = Auth.auth().currentUser {
            return Firestore.firestore().collection(Collection.users.identifier).document(user.uid)
        }
        return nil
    }
    
    var documentReference: DocumentReference? {
        switch self {
        case .createbill, .fetchBills:
            return collectionReference?.document()
        case .deleteBill(let path):
            return collectionReference?.document(path)
        }
    }
    
    var collectionReference: CollectionReference? {
        return baseDocumentReference?.collection(Collection.bill.identifier)
    }
}
