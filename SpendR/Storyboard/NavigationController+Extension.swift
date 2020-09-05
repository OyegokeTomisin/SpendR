//
//  NavigationController+Extension.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 05/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import UIKit

extension UINavigationController {

    func setTransparentNavBar() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true

        let image = UIImage(named: "leftChevron")
        navigationBar.backIndicatorImage = image
        navigationBar.backIndicatorTransitionMaskImage = image
        navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    }
}
