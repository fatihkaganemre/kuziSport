//
//  MembersItemCell.swift
//  Karate
//
//  Created by fatih on 06/06/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation
import UIKit

struct MembersItemCellViewModel {
    let image: UIImage
    let name: String
}

class MembersItemCell: UICollectionViewCell, ReusableView {
    private weak var nameLabel: UILabel!
    private weak var memberImageView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) { fatalError() }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        buildImageView()
        buildNameLabel()
    }
    
    func bind(with viewModel: MembersItemCellViewModel) {
        nameLabel.text = viewModel.name
        memberImageView.image = viewModel.image
    }
    
    private func buildImageView() {
        let imageView: UIImageView = {
            let iv = UIImageView()
            iv.contentMode = .scaleToFill
            iv.clipsToBounds = true
            iv.layer.cornerRadius = 5.0
            iv.translatesAutoresizingMaskIntoConstraints = false
            return iv
        }()
        
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 180),
            imageView.widthAnchor.constraint(equalToConstant: 160)
        ])
        
        self.memberImageView = imageView
    }
    
    private func buildNameLabel() {
        let label: UILabel = {
            let l = UILabel()
            l.textAlignment = .center
            l.numberOfLines = 0
            l.translatesAutoresizingMaskIntoConstraints = false
            return l
        }()
        
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: memberImageView.bottomAnchor, constant: 5),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor)
        ])
        
        self.nameLabel = label
    }
}
