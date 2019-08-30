//
//  CoachDetailsView.swift
//  Karate
//
//  Created by fatih on 10/08/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import UIKit

struct CoachDetailsViewModel {
    let descriptions: [String]
    let image: UIImage
    let contact: String
    let name: String
}

class CoachDetailsView: UIView {
    private weak var scrollView: UIScrollView!
    private weak var generalStackView: UIStackView!
    private weak var imageAndContactsHolderView: UIView!
    private weak var imageView: UIImageView!
    private weak var contactStackView: UIStackView!
    private weak var descriptionStackView: UIStackView!
    private weak var nameLabel: UILabel!
    private weak var contactLabel: UILabel!
    
    @available (*, unavailable) required init(coder: NSCoder) { fatalError("") }
    
    init(viewModel: CoachDetailsViewModel) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        
        buildScrollView()
        buildGeneralStackView()
        buildImageAndContactsHolderView()
        buidImageView()
        buildContactStackView()
        buildNameLabel()
        buildContactLabel()
        buildSeperatorView()
        buildDescriptionStackView()
        
        bind(with: viewModel)
    }
    
    private func bind(with viewModel: CoachDetailsViewModel) {
        imageView.image = viewModel.image
        nameLabel.text = viewModel.name.uppercased()
        setContactLabel(text: viewModel.contact)
        
        viewModel.descriptions.forEach {
            self.buildDescriptionLineLabel(text: $0)
        }
    }
    
    private func buildScrollView() {
        let scrollView: UIScrollView = {
            let sv = UIScrollView()
            sv.translatesAutoresizingMaskIntoConstraints = false
            sv.alwaysBounceVertical = true
            sv.showsHorizontalScrollIndicator = false
            sv.insert(into: self, with: .zero)
            return sv
        }()
        
        self.scrollView = scrollView
    }
    
    private func buildGeneralStackView() {
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
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        self.generalStackView = stackView
    }
    
    private func buildImageAndContactsHolderView() {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        generalStackView.addArrangedSubview(view)
        self.imageAndContactsHolderView = view
    }
    
    private func setContactLabel(text: String) {
        let mutableAttributedString = NSMutableAttributedString()
        let attributedTitle = NSAttributedString(
            string: "Contact: ",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .bold)]
        )
        mutableAttributedString.append(attributedTitle)
        
        let attributedContact = NSAttributedString(
            string: text,
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .regular)]
        )
        mutableAttributedString.append(attributedContact)
        contactLabel.attributedText = mutableAttributedString
    }
    
    private func buidImageView() {
        let imageView: UIImageView = {
            let iv = UIImageView()
            iv.contentMode = .scaleAspectFit
            iv.clipsToBounds = true
            iv.layer.cornerRadius = 5
            iv.translatesAutoresizingMaskIntoConstraints = false
            return iv
        }()
        
        imageAndContactsHolderView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: imageAndContactsHolderView.topAnchor, constant: 15),
            imageView.leadingAnchor.constraint(equalTo: imageAndContactsHolderView.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: imageAndContactsHolderView.bottomAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        self.imageView = imageView
    }
    
    private func buildContactStackView() {
        let stackView: UIStackView = {
            let sv = UIStackView()
            sv.axis = .vertical
            sv.translatesAutoresizingMaskIntoConstraints = false
            sv.spacing = 10
            return sv
        }()

        imageAndContactsHolderView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: imageAndContactsHolderView.topAnchor, constant: 15),
            stackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: imageAndContactsHolderView.trailingAnchor, constant: 15),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: imageView.bottomAnchor)
        ])
        
        self.contactStackView = stackView
    }
    
    private func buildNameLabel() {
        let label: UILabel = {
            let l = UILabel()
            l.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            l.numberOfLines = 0
            l.translatesAutoresizingMaskIntoConstraints = false
            return l
        }()
        
        contactStackView.addArrangedSubview(label)
        
        self.nameLabel = label
    }
    
    private func buildContactLabel() {
        let label: UILabel = {
            let l = UILabel()
            l.translatesAutoresizingMaskIntoConstraints = false
            return l
        }()
        
        contactStackView.addArrangedSubview(label)
        
        self.contactLabel = label
    }
    
    private func buildSeperatorView() {
        let view: UIView = {
            let v = UIView()
            v.translatesAutoresizingMaskIntoConstraints = false
            v.backgroundColor = .lightGray
            return v
        }()
        
        generalStackView.addArrangedSubview(view)
        
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 0.3),
            view.widthAnchor.constraint(equalTo: generalStackView.widthAnchor)
        ])    }
    
    private func buildDescriptionStackView() {
        let stackView: UIStackView = {
            let sv = UIStackView()
            sv.axis = .vertical
            sv.translatesAutoresizingMaskIntoConstraints = false
            sv.spacing = 10
            return sv
        }()
        
        generalStackView.addArrangedSubview(stackView)
        
        self.descriptionStackView = stackView
    }
    
    private func buildDescriptionLineLabel(text: String) {
        let label: UILabel = {
            let l = UILabel()
            l.numberOfLines = 0
            l.text = text
            l.translatesAutoresizingMaskIntoConstraints = false
            return l
        }()
        descriptionStackView.addArrangedSubview(label)
    }
}
