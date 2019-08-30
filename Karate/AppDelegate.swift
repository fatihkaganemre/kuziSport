//
//  AppDelegate.swift
//  Karate
//
//  Created by fatih on 08/05/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        _ = Dependencies
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = storyboard.instantiateInitialViewController()
        window?.makeKeyAndVisible()
        return true
    }
}

