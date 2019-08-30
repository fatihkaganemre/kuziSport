//
//  KarateUITests.swift
//  KarateUITests
//
//  Created by fatih on 08/05/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import XCTest

class KarateTestCase: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
    }

    override func tearDown() {
        app.terminate()
        app = nil
        super.tearDown()
    }

    func run(testCase: UITestCase<XCUIApplication>) {
        app.launch()
        testCase.evaluate(unit: app)
    }

}
