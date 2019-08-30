//
//  UITestCaseStep.swift
//  KarateUITests
//
//  Created by fatih on 22/08/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation
import XCTest

class UITestCaseStep<U: TestingUnit> {
    enum State: String {
        case notEvaluated
        case evaluating
        case evaluated
    }
    
    enum `Type` {
        case normal(description: String)
        case mock
    }
    
    let type: Type
    private let action: (U) -> Void
    private var state: State
    
    init(type: Type, action: @escaping (U) -> Void, state: State) {
        self.type = type
        self.action = action
        self.state = state
    }
    
    init(_ description: String, _ action: @escaping (U) -> Void) {
        self.type = .normal(description: description)
        self.action = action
        self.state = .notEvaluated
    }
    
    static func inlineMock<T>(_ action: @escaping () -> Void) -> UITestCaseStep<T> {
        return UITestCaseStep<T>(
            type: .mock,
            action: { _ in action() },
            state: .notEvaluated
        )
    }
    
    func evaluate(_ unit: U) {
        state = .evaluating
        action(unit)
        state = .evaluated
    }
    
    func getCurrentState() -> State {
        return state
    }
}
