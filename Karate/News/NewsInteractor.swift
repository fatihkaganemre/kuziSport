//
//  NewsInteractor.swift
//  Karate
//
//  Created by Little Frog on 6/2/19.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation
import UIKit

class NewsInteractor {
    private let router: NewsRouter!
    
    init(router: NewsRouter) {
        self.router = router
    }
    
    func viewModel() -> NewsViewModel {
        let items = [
            NewsItemCellViewModel(
                image: UIImage(named: "news1")!,
                title: "Students got medals".uppercased(),
                subtitle: "Our students got medals in the competition "
            ),
            NewsItemCellViewModel(
                image: UIImage(named: "news2")!,
                title: "Seminar".uppercased(),
                subtitle: "Seminarium Karate WKF z Bartłomiejem Sołtysiakiem"
            )
        ]
        
        let calendarAction: (() -> Void) = { [unowned self] in
            self.router.showUpcomingEvents()
        }
        
        let didSelectItem: ((Int) -> Void) = { [unowned self] row in
            let item = items[row]
            let details = NewDetailsViewModel(
                image: item.image,
                title: item.title,
                description: item.subtitle + ". Some other very long text to describe the event"
            )
            self.router.showDetails(viewModel: details)
        }
        
        return NewsViewModel(
            items: items,
            calendarAction: calendarAction,
            didSelect: didSelectItem
        )
    }
}
