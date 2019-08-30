//
//  InfoViewController.swift
//  Karate
//
//  Created by Little Frog on 6/2/19.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation
import UIKit

class InfoViewController: UIViewController {
    private let interactor: InfoInteractor!
    
    @available (*, unavailable) required init(coder: NSCoder) { fatalError("") }
    
    init(interactor: InfoInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
        title = "FIND US"
        edgesForExtendedLayout = []
    }
    
    override func loadView() {
        super.loadView()
        buildInfoView()
    }
    
    private func buildInfoView() {
        let viewModel = interactor.viewModel()
        let infoView = InfoView(frame: view.frame, viewModel: viewModel)
        infoView.insert(into: self.view, with: .zero)
    }
}
