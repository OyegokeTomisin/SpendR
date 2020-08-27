//
//  AppDelegate.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 26/08/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        return true
    }

    func changeRootViewController(to storyboard: Storyboard, with identifier: String) {
        let storyboard = UIStoryboard(name: storyboard.identifier, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}
