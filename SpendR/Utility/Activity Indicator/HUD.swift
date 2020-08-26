//
//  HUD.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 27/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import SVProgressHUD

final class HUD {

    static func display() {
        DispatchQueue.main.async {
            SVProgressHUD.show()
            SVProgressHUD.setDefaultMaskType(.black)
        }
    }

    static func dismiss() {
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
}
