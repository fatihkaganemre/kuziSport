//
//  Page.swift
//  KarateUITests
//
//  Created by fatih on 22/08/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation
import XCTest
import KarateDataModels

protocol Page {
    var steps: [UITestCaseStep<XCUIApplication>] { get }
    init(steps: [UITestCaseStep<XCUIApplication>])
    func finish()
}

extension Page {
    func tapButton<T: Page>(
        _ field: AccessibilityIdentifiable,
        explicitTimeout timeout: TimeInterval? = nil,
        explicitDescription: String? = nil
        ) -> T {
        return T(steps: self.steps + [
            UITestCaseStep(explicitDescription ?? "Tap button with accessibility: \(field.identifier)") {
                let button = $0.buttons[field.identifier]
                XCTAssertTrue(button.waitForExistence(timeout: timeout ?? 6.0))
                button.tap()
            }
        ])
    }
    
    func execute(_ toExecute: @escaping () -> Void) -> Self {
        return Self(steps: self.steps + [
            UITestCaseStep<XCUIApplication>.inlineMock(toExecute)
        ])
    }
    
    func finish() {
        
    }
}
