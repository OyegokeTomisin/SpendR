//
//  AuthService.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 27/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation

protocol AuthRequestServiceDelegate: AnyObject {
    func didCompleteRequestWithSuccess()
    func didCompleteRequestWithfailure(error: Error)
}

struct AuthService {
    
    private let request = AuthRequestService()
    weak var delegate: AuthRequestServiceDelegate?
    
    func createUser(with account: UserAccount) {
        request.createUser(account: account) { result in
            switch result {
            case .success:
                self.delegate?.didCompleteRequestWithSuccess()
            case .failure(let error):
                self.delegate?.didCompleteRequestWithfailure(error: error)
            }
        }
    }
    
    func loginUser(with account: UserAccount) {
        request.loginUser(account: account) { result in
            switch result {
            case .success:
                self.delegate?.didCompleteRequestWithSuccess()
            case .failure(let error):
                self.delegate?.didCompleteRequestWithfailure(error: error)
            }
        }
    }

    func logutUserAccount(completion: @escaping (Result<Any?, Error>) -> Void) {
        request.signOutUser(completion: completion)
    }
}
