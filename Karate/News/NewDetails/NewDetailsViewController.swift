//
//  NewDetailsViewController.swift
//  Karate
//
//  Created by fatih on 12/08/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import UIKit

class NewDetailsViewController: UIViewController {
    private let details: NewDetailsViewModel!
    
    @available (*, unavailable) required init(coder: NSCoder) { fatalError("") }
    
    init(details: NewDetailsViewModel) {
        self.details = details
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        super.loadView()
        let newDetailsView = NewDetailsView(viewModel: details)
        newDetailsView.translatesAutoresizingMaskIntoConstraints = false
        newDetailsView.insert(into: self.view, with: .zero)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    private func setNavigationBar() {
        let backItem = UIBarButtonItem(
            title: "Back",
            style: .plain,
            target: self,
            action: #selector(backAction)
        )
        backItem.tintColor = .white
        navigationItem.leftBarButtonItem = backItem
    }
    
    @objc private func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
}
