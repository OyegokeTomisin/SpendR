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
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = false
    }
}
