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

    private var tags = [Tag]()
    private var tagService: TagService?

    override func viewDidLoad() {
        super.viewDidLoad()
        tagTableView.tableFooterView = UIView()
        let nib = UINib(nibName: TagTableViewCell.identifier, bundle: nil)
        tagTableView.register(nib, forCellReuseIdentifier: TagTableViewCell.identifier)
        fetchTags()
    }

    private func fetchTags() {
        tagService = TagService(delegate: self)
        HUD.display()
        tagService?.fetchTags()
    }

    private func deleteTag(at index: Int) {
        if let tagId = tags[index].id {
            HUD.display()
            tagService?.deleteTag(with: tagId)
        }
    }
}

extension TagViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tags.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
            tableView.dequeueReusableCell(withIdentifier: TagTableViewCell.identifier) as? TagTableViewCell else {
                return UITableViewCell()
        }
        cell.descriptionLabel.text = tags[indexPath.item].name
        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        editingStyle == .delete ? deleteTag(at: indexPath.row) : nil
    }
}

extension TagViewController: TagServiceDelegate {
    func didCompleteRequestWithSuccess(tags: [Tag]?) {
        HUD.dismiss()
        if let tags = tags {
            self.tags = tags
            tagTableView.reloadData()
        }
    }

    func didCompleteRequestWithFailure(error: String) {
        HUD.dismiss()
        self.showAlert(title: MessageConstants.errorTitle, message: error)
    }
}
