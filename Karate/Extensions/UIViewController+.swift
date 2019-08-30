//
//  UIViewController+.swift
//  Karate
//
//  Created by fatih on 06/06/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func wrappedIntoNavigationController() -> UINavigationController {
        let navController = UINavigationController(
            navigationBarClass: nil,
            toolbarClass: nil
        )
        navController.setViewControllers([self], animated: false)
        navController.navigationBar.barTintColor = .kuziBlue
        navController.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
        loadViewIfNeeded()
        return navController
    }
}
