//
//  UpcomingEventsInteractor.swift
//  Karate
//
//  Created by fatih on 13/08/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation

class UpcomingEventsInteractor {
    private let router: UpcomingEventsRouter!
    
    init(router: UpcomingEventsRouter) {
        self.router = router
    }
    
    func viewModel() -> UpcomingEventsViewModel {
        let websites: [URL?] = [
            URL(string: "https://wkf.net/karate1-premier"),
            URL(string: "https://wkf.net/continental-championships-main/ekf-junior/"),
            URL(string: "https://wkf.net/karate1-series_2019"),
            URL(string: "https://wkf.net/continental-championships-main/akf-junior/")
        ]
        
        let items: [UpcomingEventsItem] = [
            UpcomingEventsItem(
                image: .karateOne,
                dateString: "25-27 January 2019",
                title: "Karate 1-Premier League, Paris(France)"
            ),
            UpcomingEventsItem(
                image: .ekf,
                dateString: "8-10 February 2019",
                title: "EKF Juniour, Cadet & U21 Championships, Aalborg (Denmark)"
            ),
            UpcomingEventsItem(
                image: .seriesA,
                dateString: "1-3 March 2019",
                title: "Karate 1 - Series A, Salzburg (Austria)"
            ),
            UpcomingEventsItem(
                image: .akf,
                dateString: "26-28 April 2019",
                title: "AKF Cadet, Junior & U21 Championships, Kota Kinabaku (Malaysia)"
            ),
        ]
        
        let didSelectItem: ((Int) -> Void) = { [unowned self] row in
            guard let url = websites[row] else { return }
            self.router.pushWebView(with: url)
        }
        
        return UpcomingEventsViewModel(
            items: items,
            didSelect: didSelectItem
        )
    }
}
