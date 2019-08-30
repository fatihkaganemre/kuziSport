//
//  CoachDetailsRouter.swift
//  Karate
//
//  Created by fatih on 10/08/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import UIKit
import Foundation

protocol CoachDetailsRouterType: RouterType {
    func backAction()
}

class CoachDetailsRouter: CoachDetailsRouterType {
    weak var controller: UIViewController!
    
    func backAction() {
        controller.dismiss(animated: true, completion: nil)
    }
}
