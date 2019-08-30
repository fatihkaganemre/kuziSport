//
//  DependencyContainer.swift
//  Karate
//
//  Created by fatih on 08/08/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation
import UIKit

struct DependenciesContainer {
    var applicationService: UIApplicationService
    
    init() {
        applicationService = UIApplicationServiceImp(application: .shared)
    }
}

var Dependencies = DependenciesContainer()

