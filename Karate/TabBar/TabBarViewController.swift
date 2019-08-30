
//
//  TabBarViewController.swift
//  Karate
//
//  Created by fatih on 25/05/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {
    private let interactor: TabBarInteractor!
    
    required init?(coder aDecoder: NSCoder) {
        let router = TabBarRouter()
        self.interactor = TabBarInteractor(router: router)
        super.init(coder: aDecoder)
        router.controller = self
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        let router = TabBarRouter()
        self.interactor = TabBarInteractor(router: router)
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        router.controller = self
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.view.backgroundColor = .white
        
        setViewControllers(
            interactor.controllersForTabs(),
            animated: true
        )
        
        tabBar.unselectedItemTintColor = .black
        tabBar.tintColor = .white
        tabBar.barTintColor = .kuziBlue
    }
}
