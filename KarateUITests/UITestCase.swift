//
//  UITestCase.swift
//  KarateUITests
//
//  Created by fatih on 22/08/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation
import XCTest

struct UITestCase<U: TestingUnit> {
    let steps: [UITestCaseStep<U>]
    
    init(steps: [UITestCaseStep<U>]) {
        self.steps = steps
    }
    
    func evaluate(unit: U) {
        steps.forEach { $0.evaluate(unit) }
    }
}

extension UITestCase where U == XCUIApplication {
    init(page: Page) {
        self.steps = page.steps
    }
}
