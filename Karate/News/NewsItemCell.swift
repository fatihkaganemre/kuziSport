//
//  NewsView.swift
//  Karate
//
//  Created by Little Frog on 6/3/19.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation
import UIKit

struct NewsItemCellViewModel {
    let image: UIImage
    let title: String
    let subtitle: String
}

class NewsItemCell: UITableViewCell, ReusableView {
    private weak var titleLabel: UILabel!
    private weak var subtitleLabel: UILabel!
    private weak var newsImageView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) { fatalError() }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        buildImageView()
        buildTitleLabel()
        buildSubtitleLabel()
    }
    
    override func prepareForReuse() {
        newsImageView?.image = nil
        titleLabel.text = nil
        subtitleLabel.text = nil
    }
    
    func bind(with viewModel: NewsItemCellViewModel) {
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        newsImageView.image = viewModel.image
    }
    
    private func buildImageView() {
        let imageView: UIImageView = {
            let iv = UIImageView()
            iv.contentMode = .scaleAspectFill
            iv.layer.masksToBounds = true
            iv.layer.cornerRadius = 5.0
            iv.translatesAutoresizingMaskIntoConstraints = false
            return iv
        }()
        
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        self.newsImageView = imageView
    }
    private func buildTitleLabel() {
        let titleLabel: UILabel = {
            let l = UILabel()
            l.font = .systemFont(ofSize: 15, weight: .bold)
            l.translatesAutoresizingMaskIntoConstraints = false
            return l
        }()
        
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        self.titleLabel = titleLabel
    }
    
    private func buildSubtitleLabel() {
        let subtitleLabel: UILabel = {
            let l = UILabel()
            l.font = .systemFont(ofSize: 15, weight: .regular)
            l.numberOfLines = 0
            l.translatesAutoresizingMaskIntoConstraints = false
            return l
        }()
        
        addSubview(subtitleLabel)
        
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        
        self.subtitleLabel = subtitleLabel
    }
}
