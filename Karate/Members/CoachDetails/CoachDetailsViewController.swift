//
//  CoachDetailsViewController.swift
//  Karate
//
//  Created by fatih on 10/08/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import UIKit

class CoachDetailsViewController: UIViewController {
    private let interactor: CoachDetailsInteractor!
    
    @available (*, unavailable) required init(coder: NSCoder) { fatalError("") }
    
    init(interactor: CoachDetailsInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        super.loadView()
        let viewModel = interactor.viewModel()
        let coachDetailsView = CoachDetailsView(viewModel: viewModel)
        coachDetailsView.insert(into: self.view, with: .zero)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    
    private func setNavigationBar() {
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backIndicatorImage = UIImage()
        navigationController?.navigationBar.barTintColor = .white
        
        let backItem = UIBarButtonItem(
            title: "Back",
            style: .plain,
            target: self,
            action: #selector(backAction)
        )
        backItem.tintColor = .kuziBlue
        navigationItem.leftBarButtonItem = backItem
    }
    
    @objc private func backAction() {
        interactor.backAction()
    }
}
