//
//  InfoPage.swift
//  KarateUITests
//
//  Created by fatih on 22/08/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation
import XCTest
import KarateDataModels

struct InfoPage: TabRootPage {
    let steps: [UITestCaseStep<XCUIApplication>]
    
    func tapCallButton() -> InfoPage {
        return tapButton(Accessibility.callButton)
    }
}
