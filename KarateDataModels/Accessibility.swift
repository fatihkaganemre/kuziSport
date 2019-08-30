//
//  Accessibility.swift
//  Karate
//
//  Created by fatih on 22/08/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation

public enum Accessibility: String, AccessibilityIdentifiable {
    case callButton
    
    
    /*
     For each page
     public enum pageName: String AccessibilityIdentifiable {
         case ..
     }
     
     if there is cells it is good idea to create a struct like
     
     public struct Cell: AccessibilityIdentifiable {
         let row: Int
         let type: String
         public let label: String?
     
         public init(row: Int, type: String, label: String?) {
             self.row = row
             self.type = type
             self.label = label
         }
     
         public var identifier: String {
             return "book-tab-list-\(type)-\(row)"
         }
     }
     */
}


