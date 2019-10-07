//
//  InfoVIew.swift
//  Karate
//
//  Created by fatih on 06/06/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import KarateDataModels

struct InfoViewModel {
    let coordinate: CLLocationCoordinate2D
    let imageAnnotationTitle: String

    let facebookButtonAction: (() -> Void)
    let instagramButtonAction: (() -> Void)
    let callButtonAction: (() -> Void)
}

class InfoView: UIView {
    private weak var mapImageView: MKMapView!
    private weak var stackView: UIStackView!
    private weak var facebookButton: UIButton!
    private weak var instagramButton: UIButton!
    private weak var callButton: UIButton!
    private let viewModel: InfoViewModel
    
    required init?(coder aDecoder: NSCoder) { fatalError() }
    
    init(frame: CGRect, viewModel: InfoViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        buildStackView()
        buildAddressTextView()
        buildFacebookButton()
        buildInstagramButton()
        buildCallButton()
        buildMapImageView()
        buildCenterToAnotationButton()
        
        bind(with: viewModel)
    }
    
    private func bind(with viewModel: InfoViewModel) {
        facebookButton.addTarget(self, action: #selector(facebookButtonTapped), for: .touchUpInside)
        instagramButton.addTarget(self, action: #selector(instagramButtonTapped), for: .touchUpInside)
        callButton.addTarget(self, action: #selector(callButtonTapped), for: .touchUpInside)
    }
    
    @objc private func facebookButtonTapped() {
        viewModel.facebookButtonAction()
    }
    
    @objc private func instagramButtonTapped() {
        viewModel.instagramButtonAction()
    }
    
    @objc private func callButtonTapped() {
        viewModel.callButtonAction()
    }
    
    private func buildStackView() {
        let stackView: UIStackView = {
            let sv = UIStackView()
            sv.translatesAutoresizingMaskIntoConstraints = false
            sv.axis = .vertical
            sv.spacing = 15
            return sv
        }()
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        self.stackView = stackView
    }
    
    private func buildAddressTextView() {
        
        let textView: UITextView = {
            let tv = UITextView()
            tv.translatesAutoresizingMaskIntoConstraints = false
            tv.attributedText = attributedAddressTitle()
            tv.textColor = .black
            tv.textAlignment = .center
            tv.isEditable = false
            tv.isScrollEnabled = false
            tv.sizeToFit()
            return tv
        }()
        
        stackView.addArrangedSubview(textView)
    }
    
    private func attributedAddressTitle() -> NSMutableAttributedString {
        let mutableAttributedString = NSMutableAttributedString()
        let attributedTitle = NSAttributedString(
            string: "ADDRESS",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .bold)]
        )
        mutableAttributedString.append(attributedTitle)
        
        let attributedAddress = NSAttributedString(
            string: "\n ul. Świętego Michała 50\n 60-193 Poznań",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .regular)]
        )
        
        mutableAttributedString.append(attributedAddress)
        
        return mutableAttributedString
    }
    
    @objc private func buildFacebookButton() {
        let button: UIButton = {
            let b = UIButton()
            b.translatesAutoresizingMaskIntoConstraints = false
            b.setTitle("FACEBOOK", for: .normal)
            b.backgroundColor = .blue
            b.layer.cornerRadius = 5.0
            b.setTitleColor(.white, for: .normal)
            return b
        }()
        stackView.addArrangedSubview(button)
        self.facebookButton = button
    }
    
    private func buildInstagramButton() {
        let button: UIButton = {
            let b = UIButton()
            b.translatesAutoresizingMaskIntoConstraints = false
            b.setTitle("INSTAGRAM", for: .normal)
            b.backgroundColor = .purple
            b.layer.cornerRadius = 5.0
            b.setTitleColor(.white, for: .normal)
            return b
        }()
        stackView.addArrangedSubview(button)
        self.instagramButton = button
    }
    
    private func buildCallButton() {
        let button: UIButton = {
            let b = UIButton()
            b.translatesAutoresizingMaskIntoConstraints = false
            b.setTitle("CALL US", for: .normal)
            b.setTitleColor(.white, for: .normal)
            b.layer.cornerRadius = 5.0
            b.imageView?.tintColor = .white
            b.backgroundColor = .black
            b.accessibilityLabel = Accessibility.callButton.identifier
            return b
        }()
        stackView.addArrangedSubview(button)
        self.callButton = button
    }
    
    private func buildMapImageView() {
        let mapView = MapViewHelper().mapView(
            title: viewModel.imageAnnotationTitle,
            coordinate: viewModel.coordinate
        )
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(mapView)
        
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mapView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30)
        ])
        
        self.mapImageView = mapView
    }
    
    private func buildCenterToAnotationButton() {
        let button: UIButton = {
            let b = UIButton()
            b.translatesAutoresizingMaskIntoConstraints = false
            b.backgroundColor = .red
            b.layer.cornerRadius = 10
            b.addTarget(self, action: #selector(centerToAnnotation), for: .touchUpInside)
            return b
        }()
        
        mapImageView.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: mapImageView.topAnchor, constant: 10),
            button.trailingAnchor.constraint(equalTo: mapImageView.trailingAnchor, constant: -10),
            button.heightAnchor.constraint(equalToConstant: 20),
            button.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    @objc func centerToAnnotation() {
        mapImageView.setCenter(viewModel.coordinate, animated: true)
    }
}
