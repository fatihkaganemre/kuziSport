//
//  InfoInteractorTests.swift
//  KarateTests
//
//  Created by fatih on 22/08/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation
import XCTest

@testable import Karate

class InfoInteractorTests: XCTestCase {
    private var sut: InfoInteractor!
    private var router: InfoRouterTypeMock!
    
    override func setUp() {
        super.setUp()
        router = InfoRouterTypeMock()
        sut = InfoInteractor(router: router!)
    }
    
    
    func testCallUs() {
        // When
        let viewModel = sut.viewModel()
        viewModel.callButtonAction()
        
        // Then
        XCTAssertEqual(router.callNumberCalled, true)
        XCTAssertEqual(router.callNumberReceivedNumber, "+48 505 875 735")
    }
}
