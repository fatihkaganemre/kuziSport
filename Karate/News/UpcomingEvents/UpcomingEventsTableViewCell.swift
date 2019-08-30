//
//  UpcomingEventsTableViewCell.swift
//  Karate
//
//  Created by fatih on 13/08/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import UIKit

class UpcomingEventsTableViewCell: UITableViewCell, ReusableView {
    private weak var eventIcon: UIImageView!
    private weak var verticalStackView: UIStackView!
    private weak var dateLabel: UILabel!
    private weak var titleLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) { fatalError() }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildImageView()
        buildVerticalStackView()
        buildDateLabel()
        buildTitleLabel()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView?.image = nil
    }
    
    func bind(with item: UpcomingEventsItem) {
        self.titleLabel.text = item.title
        self.dateLabel.text = item.dateString
        self.imageView?.image = item.image
    }
    
    private func buildImageView() {
        let imageView: UIImageView = {
            let iv = UIImageView()
            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.contentMode = .scaleToFill
            return iv
        }()
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            imageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -15),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            imageView.heightAnchor.constraint(equalToConstant: 40),
            imageView.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        self.eventIcon = imageView
    }
    
    private func buildVerticalStackView() {
        let verticalStackView: UIStackView = {
            let sv = UIStackView()
            sv.axis = .vertical
            sv.translatesAutoresizingMaskIntoConstraints = false
            sv.spacing = 5
            return sv
        }()
        
        addSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: eventIcon.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            verticalStackView.leadingAnchor.constraint(equalTo: eventIcon.trailingAnchor, constant: 15),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -15)
        ])
        
        self.verticalStackView = verticalStackView
    }
    
    private func buildDateLabel() {
        let label: UILabel = {
            let l = UILabel()
            l.translatesAutoresizingMaskIntoConstraints = false
            l.numberOfLines = 0
            l.font = .systemFont(ofSize: 15, weight: .bold)
            return l
        }()
        
        verticalStackView.addArrangedSubview(label)
        self.dateLabel = label
    }
    
    private func buildTitleLabel() {
        let label: UILabel = {
            let l = UILabel()
            l.translatesAutoresizingMaskIntoConstraints = false
            l.numberOfLines = 0
            l.font = .systemFont(ofSize: 15, weight: .regular)
            return l
        }()
        
        verticalStackView.addArrangedSubview(label)
        self.titleLabel = label
    }
}
