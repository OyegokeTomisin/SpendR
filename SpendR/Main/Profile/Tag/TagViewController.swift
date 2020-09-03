//
//  TagViewController.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 03/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import UIKit

class TagViewController: UIViewController {

    @IBOutlet weak var tagTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tagTableView.tableFooterView = UIView()
    }
}

extension TagViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
