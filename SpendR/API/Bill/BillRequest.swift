//
//  BillRequest.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 31/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation

struct BillRequest {

    private let router = Router<BillAPI>()

    func createBill(bill: Bill, completion: @escaping NetworkRouterCompletion) {
        router.request(.createbill(bill: bill), completion: completion)
    }

    func fetchBill(completion: @escaping NetworkRouterCompletion) {
        router.request(.fetchBills, completion: completion)
    }

    func deleteBill(with billId: String, completion: @escaping NetworkRouterCompletion) {
        router.request(.deleteBill(billId: billId), completion: completion)
    }
}
