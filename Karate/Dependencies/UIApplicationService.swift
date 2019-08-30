//
//  ApplicationService.swift
//  Karate
//
//  Created by fatih on 08/08/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation
import UIKit

protocol UIApplicationService: AutoMockable {
    func open(phoneNumber: String)
    func openDeviceSettings()
    func open(url: URL)
}

class UIApplicationServiceImp: UIApplicationService {
    private let application: UIApplication
    
    init(application: UIApplication) {
        self.application = application
    }
    
    func open(phoneNumber: String) {
        guard let encodedNumber = phoneNumber.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed),
            let url = URL(string: "tel://\(encodedNumber)") else {
                return
        }
        open(url: url)
    }
    
    func openDeviceSettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
        open(url: url)
    }
    
    func open(url: URL) {
        if application.canOpenURL(url) {
            application.open(url, options: [:], completionHandler: nil)
        }
    }
}
