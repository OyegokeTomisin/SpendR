//
//  TagCollectionViewCell.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 02/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tagView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func toggleSelectedState(to selected: Bool = false) {
        tagView.backgroundColor = selected ? .systemTeal : .systemYellow
    }
}
