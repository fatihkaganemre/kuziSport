//
//  TabRootPage.swift
//  KarateUITests
//
//  Created by fatih on 22/08/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation
import XCTest

enum TabControllerPages: String {
    case news = "NEWS"
    case members = "MEMBERS"
    case info = "INFO"
}

protocol TabRootPage: Page {
    func tapNewsTab() -> NewsPage
    func tapMembersTab() -> MembersPage
    func tapInfoTab() -> InfoPage
}

extension TabRootPage {
    func tapNewsTab() -> NewsPage {
        return tapTab(.news)
    }
    
    func tapMembersTab() -> MembersPage {
        return tapTab(.members)
    }
    
    func tapInfoTab() -> InfoPage {
        return tapTab(.info)
    }
    
    func validateTabBarIsVisible(tab: TabControllerPages) -> Self {
        return Self(steps: self.steps + [
            UITestCaseStep("Assert that tab bar is visible with selected item: \(tab.rawValue)") {
                let button = $0.tabBars.buttons[tab.rawValue]
                XCTAssertTrue(button.waitForExistence(timeout: 12.0))
            }
        ])
    }
    
    private func tapTab<T: Page>(_ tab: TabControllerPages) -> T {
        return T(steps: self.steps + [
            UITestCaseStep("Select Tab: \(tab.rawValue)") {
                let button = $0.tabBars.buttons[tab.rawValue]
                XCTAssertTrue(button.waitForExistence(timeout: 6.0))
                button.tap()
            }
        ])
    }
}
