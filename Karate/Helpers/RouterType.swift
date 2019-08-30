//
//  RouterType.swift
//  Karate
//
//  Created by fatih on 08/05/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation
import UIKit

protocol RouterType {
    var controller: UIViewController! { get set }
}

extension RouterType {
    func back() {
        controller.navigationController?.popViewController(animated: true)
    }
    
    func present(viewController: UIViewController) {
        controller.present(viewController, animated: true)
    }
    
    func push(viewController: UIViewController) {
        controller.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func presentWebView(with url: URL) {
        let controller = ControllerBuilder().build(.web(url: url))
        present(viewController: controller)
    }
    
    func pushWebView(with url: URL) {
        let controller = ControllerBuilder().build(.web(url: url))
        push(viewController: controller)
    }
}
