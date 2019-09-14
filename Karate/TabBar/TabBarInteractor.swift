//
//  TabBarInteractor.swift
//  Karate
//
//  Created by fatih on 25/05/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation
import UIKit

class TabBarInteractor {
    private let router: TabBarRouter!
    
    init(router: TabBarRouter) {
        self.router = router
    }
    
    enum Tabs {
        case news
        case members
        case info
        
        var tabBarItem: UITabBarItem {
            switch self {
            case .news:
                return UITabBarItem(
                    title: "NEWS",
                    image: UIImage(named: "news"),
                    selectedImage: UIImage(named: "newsSelected")
                )
            case .members:
                return UITabBarItem(
                    title: "MEMBERS",
                    image: UIImage(named: "members"),
                    selectedImage: UIImage(named: "membersSelected")
                )
            case .info:
                return UITabBarItem(
                    title: "INFO",
                    image: UIImage(named: "info"),
                    selectedImage: UIImage(named: "infoSelected")
                )
            }
            
            // TO DO: There will be notifications tab
        }
    }
    
    func controllersForTabs() -> [UIViewController] {
        let controllerBuilder = ControllerBuilder()
        let controllers = [Tabs.news, .members, .info]
            .map { tabs -> UIViewController in
                switch tabs {
                case .news:
                    let controller = controllerBuilder.build(.news)
                    controller.tabBarItem = tabs.tabBarItem
                    return controller
                case .members:
                    let controller = controllerBuilder.build(.members)
                    controller.tabBarItem = tabs.tabBarItem
                    return controller
                case .info:
                    let controller = controllerBuilder.build(.info)
                    controller.tabBarItem = tabs.tabBarItem
                    return controller
                }
        }

        return controllers
    }
}
