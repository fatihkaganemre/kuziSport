//
//  NewDetailsView.swift
//  Karate
//
//  Created by fatih on 12/08/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import UIKit

struct NewDetailsViewModel {
    let image: UIImage
    let title: String
    let description: String
}

class NewDetailsView: UIView {
    private weak var imageView: UIImageView!
    private weak var scrollView: UIScrollView!
    private weak var stackView: UIStackView!
    
    required init?(coder aDecoder: NSCoder) { fatalError() }
    
    init(viewModel: NewDetailsViewModel) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        
        buildScrollView()
        buildImageView(image: viewModel.image)
        buildStackView()
        buildTitleLabel(title: viewModel.title)
        buildDescriptionLabel(description: viewModel.description)
    }
    
    private func buildScrollView() {
        let scrollView: UIScrollView = {
            let sv = UIScrollView()
            sv.translatesAutoresizingMaskIntoConstraints = false
            sv.alwaysBounceVertical = true
            sv.showsHorizontalScrollIndicator = false
            sv.alwaysBounceVertical = true
            sv.insert(into: self, with: .zero)
            return sv
        }()
        
        self.scrollView = scrollView
    }
    
    private func buildImageView(image: UIImage) {
        let imageView: UIImageView = {
            let iv = UIImageView()
            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.image = image
            iv.contentMode = .scaleToFill
            iv.layer.cornerRadius = 5.0
            return iv
        }()
        
        scrollView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        self.imageView = imageView
    }
    
    private func buildStackView() {
        let stackView: UIStackView = {
            let sv = UIStackView()
            sv.translatesAutoresizingMaskIntoConstraints = false
            sv.axis = .vertical
            sv.spacing = 15
            return sv
        }()
        
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        self.stackView = stackView
    }
    
    private func buildTitleLabel(title: String) {
        let label: UILabel = {
            let l = UILabel()
            l.translatesAutoresizingMaskIntoConstraints = false
            l.text = title.uppercased()
            l.numberOfLines = 0
            l.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            return l
        }()
        stackView.addArrangedSubview(label)
    }
    
    private func buildDescriptionLabel(description: String) {
        let label: UILabel = {
            let l = UILabel()
            l.translatesAutoresizingMaskIntoConstraints = false
            l.numberOfLines = 0
            l.text = description
            l.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            return l
        }()
        stackView.addArrangedSubview(label)
    }
}
