//
//  BillService.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 01/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation

struct BillService {

    private let request = BillRequest()
    weak var delegate: BillServicedelegate?

    func create(bill: Bill) {
        request.createBill(bill: bill) { result in
            switch result {
            case .success:
                self.delegate?.didCompleteRequestWithSuccess(bills: nil)
            case .failure(let error):
                self.delegate?.didCompleteRequestWithFailure(error: error.localizedDescription)
            }
        }
    }

    func fetchBills() {
        request.fetchBill { result in
            switch result {
            case .success(let response):
                let bills = response?.documents.compactMap({ try? $0.data(as: Bill.self) })
                self.delegate?.didCompleteRequestWithSuccess(bills: bills)
            case .failure(let error):
                self.delegate?.didCompleteRequestWithFailure(error: error.localizedDescription)
            }
        }
    }

    func deleteBill(with id: String) {
        request.deleteBill(with: id) { result in
            switch result {
            case .success:
                self.delegate?.didCompleteRequestWithSuccess(bills: nil)
            case .failure(let error):
                self.delegate?.didCompleteRequestWithFailure(error: error.localizedDescription)
            }
        }
    }
}
