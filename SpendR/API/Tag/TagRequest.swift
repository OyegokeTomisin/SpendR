//
//  TagRequest.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 31/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct TagRequest {
    
    private let router = Router<TagAPI>()

    func createTag(tag: Tag, completion: @escaping NetworkRouterCompletion) {
        router.request(.createTag(tag: tag), completion: completion)
    }

    func fetchTags(completion: @escaping NetworkRouterCompletion) {
        router.request(.fetchTags, completion: completion)
    }

    func deleteTag(tagId: String, completion: @escaping NetworkRouterCompletion) {
        router.request(.deletetag(tagId: tagId), completion: completion)
    }
}
