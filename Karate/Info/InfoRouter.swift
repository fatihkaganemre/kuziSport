//
//  InfoRouter.swift
//  Karate
//
//  Created by Little Frog on 6/2/19.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation
import UIKit

protocol InfoRouterType: RouterType, AutoMockable {
    func call(number: String)
    func open(url: URL)
}

class InfoRouter: InfoRouterType {
    weak var controller: UIViewController!
    
    func call(number: String) {
        Dependencies.applicationService.open(phoneNumber: number)
    }
    
    func open(url: URL) {
        Dependencies.applicationService.open(url: url)
    }
}
