//
//  NewsViewController.swift
//  Karate
//
//  Created by Little Frog on 6/2/19.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation
import UIKit

struct NewsViewModel {
    let items: [NewsItemCellViewModel]
    let calendarAction: (() -> Void)
    let didSelect: ((Int) -> Void)
}

class NewsTableViewController: UITableViewController {
    private let interactor: NewsInteractor!
    private let viewModel: NewsViewModel!
    
    @available (*, unavailable) required init(coder: NSCoder) { fatalError("") }
    
    init(interactor: NewsInteractor) {
        self.interactor = interactor
        self.viewModel = interactor.viewModel()
        super.init(nibName: nil, bundle: nil)
        self.title = "KUZI SPORT KARATE"
        buildCalenderButton()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(NewsItemCell.self)
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func buildCalenderButton() {
        let calendarBarButton = UIBarButtonItem(
            image: UIImage(named: "calendar"),
            style: .plain,
            target: self,
            action: #selector(calendarAction)
        )
        calendarBarButton.tintColor = .white
        self.navigationItem.rightBarButtonItem = calendarBarButton
    }
    
    @objc func calendarAction() {
        viewModel.calendarAction()
    }
}

extension NewsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NewsItemCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.bind(with: viewModel.items[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelect(indexPath.row)
    }
}
