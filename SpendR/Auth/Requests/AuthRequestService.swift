//
//  AuthRequestService.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 26/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation
import FirebaseAuth

typealias AuthRequestCompletion = Result<AuthDataResult, Error>

struct AuthRequestService {
    
    func createUser(account: UserAccount, completion: @escaping (AuthRequestCompletion) -> Void) {
        Auth.auth().createUser(withEmail: account.email, password: account.password) { authResult, error in
            
            if let error = error {
                completion(.failure(error))
            }
            
            if let resultData = authResult {
                completion(.success(resultData))
            }
        }
    }
    
    func loginUser(account: UserAccount, completion: @escaping (AuthRequestCompletion) -> Void) {
        Auth.auth().signIn(withEmail: account.email, password: account.password) { authResult, error in
            
            if let error = error {
                completion(.failure(error))
            }
            
            if let resultData = authResult {
                completion(.success(resultData))
            }
        }
    }

    func signOutUser(completion: @escaping (Result<Any?, Error>) -> Void) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            completion(.success(nil))
        } catch let error {
            completion(.failure(error))
        }
    }
}
