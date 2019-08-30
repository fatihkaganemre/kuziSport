//
//  TabBarRouter.swift
//  Karate
//
//  Created by fatih on 25/05/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import UIKit
import Foundation

protocol TabBarRouterType: RouterType {
    func openCalendar()
}

final class TabBarRouter: TabBarRouterType {
    weak var controller: UIViewController!
    
    func openCalendar() {
        
    }
}
