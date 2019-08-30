//
//  MembersRouter.swift
//  Karate
//
//  Created by Little Frog on 6/2/19.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation
import UIKit

protocol MembersRouterType: RouterType {
    func showCoachDetails()
}

class MembersRouter: MembersRouterType {
    weak var controller: UIViewController!
    
    func showCoachDetails() {
        let coachDetailsController = ControllerBuilder().build(.coachDetails)
        present(viewController: coachDetailsController)
    }
}
