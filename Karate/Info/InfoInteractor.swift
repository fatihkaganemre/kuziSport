//
//  InfoInteractor.swift
//  Karate
//
//  Created by Little Frog on 6/2/19.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation
import MapKit

class InfoInteractor {
    private let router: InfoRouterType!
    
    init(router: InfoRouterType) {
        self.router = router
    }
    
    func viewModel() -> InfoViewModel {
        let facebookAction: (() -> Void) = { [unowned self] in
            let url = URL(string: "https://www.facebook.com/kuzisport/")!
            self.router.open(url: url)
        }
        
        let instagramAction: (() -> Void) = { [unowned self] in
            let url = URL(string: "https://www.instagram.com/kuzisport/")!
            self.router.open(url: url)
        }
        
        let callAction: (() -> Void) = { [unowned self] in
            self.router.call(number: "+48 505 875 735")
        }
        
        return InfoViewModel(
            coordinate: CLLocationCoordinate2D(latitude: 52.414344, longitude: 16.966102),
            imageAnnotationTitle: "Kuzi Sport Karate",
            facebookButtonAction: facebookAction,
            instagramButtonAction: instagramAction,
            callButtonAction: callAction
        )
    }
}
