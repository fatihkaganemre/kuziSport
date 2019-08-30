//
//  NewsRouter.swift
//  Karate
//
//  Created by Little Frog on 6/2/19.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation
import UIKit

protocol NewsRouterType: RouterType {
    func showUpcomingEvents() 
    func showDetails(viewModel: NewDetailsViewModel)
}

class NewsRouter: NewsRouterType {
    weak var controller: UIViewController!
    
    func showUpcomingEvents() {
        let upcomingEventsController = ControllerBuilder().build(.upcomingEvents)
        push(viewController: upcomingEventsController)
    }
    
    func showDetails(viewModel: NewDetailsViewModel) {
        let newDetailsController = ControllerBuilder().build(.newDetails(viewModel))
        controller.show(newDetailsController, sender: nil)
    }
}
