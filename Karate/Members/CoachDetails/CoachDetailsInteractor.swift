//
//  CoachDetailsInteractor.swift
//  Karate
//
//  Created by fatih on 10/08/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import UIKit

class CoachDetailsInteractor {
    private let router: CoachDetailsRouter!
    
    init(router: CoachDetailsRouter) {
        self.router = router
    }
    
    func viewModel() -> CoachDetailsViewModel {
        let descriptions: [String] = [
            "Założyciel Klubu Sportów Walki Kuzi Sport",
            "Trener karate i gimnastyki",
            "Licencjonowany Trener Polskiej Unii Karate",
            "Wielokrotny Mistrz Polski oraz Medalista Mistrzostw Europy karate Shotokan",
            "Trener Kadry Narodowej Shotokan/WKF na lata 2010/2011"
        ].map { "\u{2022} \($0)"}

        return CoachDetailsViewModel(
            descriptions: descriptions,
            image: UIImage(named: "lukasz")!,
            contact: "785 082 777",
            name: "Łukasz Kuzemko"
        )
    }
    
    func backAction() {
        router.backAction()
    }
}
