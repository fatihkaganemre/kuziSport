//
//  ControllerBuilder.swift
//  Karate
//
//  Created by fatih on 25/05/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation
import UIKit

enum Controller {
    case news
    case members
    case info
    case web(url: URL)
    case coachDetails
    case newDetails(NewDetailsViewModel)
    case upcomingEvents
}

struct ControllerBuilder {
    func build(_ controller: Controller) -> UIViewController {
        switch controller {
        case .news: return buildNewsController()
        case .members: return buildMembersController()
        case .info: return buildInfoController()
        case .web(let url): return buildWebViewController(url: url)
        case .coachDetails: return buildCoachDetails()
        case .newDetails(let details): return buildNewDetailsController(details: details)
        case .upcomingEvents: return buildUpcomingEventsController()
        }
    }
}

extension ControllerBuilder {
    private func buildNewsController() -> UIViewController {
        let router = NewsRouter()
        let interactor = NewsInteractor(router: router)
        let controller = NewsTableViewController(interactor: interactor)
        router.controller = controller
        return controller.wrappedIntoNavigationController()
    }
    
    private func buildMembersController() -> UIViewController {
        let router = MembersRouter()
        let interactor = MembersInteractor(router: router)
        let controller = MembersViewController(interactor: interactor)
        router.controller = controller
        return controller
    }
    
    private func buildInfoController() -> UIViewController {
        let router = InfoRouter()
        let interactor = InfoInteractor(router: router)
        let controller = InfoViewController(interactor: interactor)
        router.controller = controller
        return controller.wrappedIntoNavigationController()
    }
    
    private func buildCoachDetails() -> UIViewController {
        let router = CoachDetailsRouter()
        let interactor = CoachDetailsInteractor(router: router)
        let controller = CoachDetailsViewController(interactor: interactor)
        router.controller = controller
        return controller.wrappedIntoNavigationController()
    }
    
    private func buildNewDetailsController(details: NewDetailsViewModel) -> UIViewController {
        return NewDetailsViewController(details: details)
    }
    
    private func buildUpcomingEventsController() -> UIViewController {
        let router = UpcomingEventsRouter()
        let interactor = UpcomingEventsInteractor(router: router)
        let controller = UpcomingEventsTableViewController(interactor: interactor)
        router.controller = controller
        return controller
    }
    
    private func buildWebViewController(url: URL) -> UIViewController {
        return WebViewController(url: url)
    }
}
