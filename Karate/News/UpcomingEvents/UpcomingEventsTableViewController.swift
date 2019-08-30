//
//  CalendarViewController.swift
//  Karate
//
//  Created by fatih on 08/08/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import UIKit

struct UpcomingEventsViewModel {
    let items: [UpcomingEventsItem]
    let didSelect: ((Int) -> Void)
}

struct UpcomingEventsItem {
    let image: UIImage
    let dateString: String
    let title: String
}

class UpcomingEventsTableViewController: UITableViewController {
    private let interactor: UpcomingEventsInteractor!
    private let viewModel: UpcomingEventsViewModel
    
    init(interactor: UpcomingEventsInteractor) {
        self.interactor = interactor
        self.viewModel = interactor.viewModel()
        super.init(nibName: nil, bundle: nil)
        self.title = "UPCOMING EVENTS"
        setupTableView()
        setNavigationBar()
    }
    
    @available (*, unavailable) required init(coder: NSCoder) { fatalError("") }
    
    private func setupTableView() {
        tableView.register(UpcomingEventsTableViewCell.self)
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.translatesAutoresizingMaskIntoConstraints = false
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    @objc private func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension UpcomingEventsTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelect(indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UpcomingEventsTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.bind(with: viewModel.items[indexPath.row])
        return cell
    }
}
