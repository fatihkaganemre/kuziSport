//
//  AccessibilityIdentifiable.swift
//  Karate
//
//  Created by fatih on 22/08/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation

public protocol AccessibilityIdentifiable {
    var label: String? { get }
    var identifier: String { get }
}

extension AccessibilityIdentifiable where Self: RawRepresentable, Self.RawValue == String {
    public var label: String? {
        return nil
    }
    
    public var identifier: String {
        return rawValue
    }
}
