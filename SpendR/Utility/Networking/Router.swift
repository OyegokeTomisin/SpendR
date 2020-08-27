//
//  Router.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 27/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation

class Router {

    func request(task: NetworkTask) {
        switch task {
        case .create:
            create()
        case .read:
            read()
        case .update:
            update()
        case .delete:
            delete()
        }
    }

    private func create() {

    }

    private func read() {

    }

    private func update() {

    }

    private func delete() {

    }
}
