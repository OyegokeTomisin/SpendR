//
//  TagAPI.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 30/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

enum TagAPI: NetworkEndpoint {
    case createTag(tag: EndpointData)
    case deletetag(tagId: String)
    case fetchTags
    
    var networkTask: NetworkTask {
        switch self {
        case .createTag(let data):
            return .create(data: data.asParameter)
        case .deletetag:
            return .delete
        case .fetchTags:
            return .read
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
        case .createTag, .fetchTags:
            return collectionReference?.document()
        case .deletetag(let path):
            return collectionReference?.document(path)
        }
    }
    
    var collectionReference: CollectionReference? {
        return baseDocumentReference?.collection(Collection.tags.identifier)
    }
}
