//
//  InfoTabTests.swift
//  KarateUITests
//
//  Created by fatih on 22/08/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation

class InfoTabTests: KarateTestCase {
    private var newsPage: NewsPage!
    
    override func setUp() {
        super.setUp()
        newsPage = NewsPage(steps: [])
    }
    
    func testTab() {
        run(testCase:
            UITestCase(
                page: newsPage
                    .tapInfoTab()
                    .tapMembersTab()
                    .tapNewsTab()
            )
        )
    }
}
