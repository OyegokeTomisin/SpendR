//
//  TagService.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 01/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation

struct TagService {

    private let request = TagRequest()
    weak var delegate: TagServiceDelegate?

    func create(tag: Tag) {
        request.createTag(tag: tag) { result in
            switch result {
            case .success:
                self.delegate?.didCompleteRequestWithSuccess(tags: nil)
            case .failure(let error):
                self.delegate?.didCompleteRequestWithFailure(error: error.localizedDescription)
            }
        }
    }

    func fetchTags() {
        request.fetchTags { result in
            switch result {
            case .success(let response):
                let tags = response?.documents.compactMap({ try? $0.data(as: Tag.self) })
                self.delegate?.didCompleteRequestWithSuccess(tags: tags)
            case .failure(let error):
                self.delegate?.didCompleteRequestWithFailure(error: error.localizedDescription)
            }
        }
    }

    func deleteTag(with id: String){
        request.deleteTag(tagId: id) { result in
            switch result {
            case .success:
                self.delegate?.didCompleteRequestWithSuccess(tags: nil)
            case .failure(let error):
                self.delegate?.didCompleteRequestWithFailure(error: error.localizedDescription)
            }
        }
    }
}
