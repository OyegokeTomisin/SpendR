//
//  ExpenseAPI.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 31/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

enum ExpenseAPI: NetworkEndpoint {
    case fetchExpenses
    case deleteExpense(expenseId: String)
    case createExpense(expense: EndpointData)

    var networkTask: NetworkTask {
        switch self {
        case .createExpense(let expense):
            return .create(data: expense.asParameter)
        case .fetchExpenses:
            return .read
        case .deleteExpense:
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
        case .fetchExpenses, .createExpense:
            return collectionReference?.document()
        case .deleteExpense(let path):
            return collectionReference?.document(path)
        }
    }

    var collectionReference: CollectionReference? {
        return baseDocumentReference?.collection(Collection.expense.identifier)
    }
}
