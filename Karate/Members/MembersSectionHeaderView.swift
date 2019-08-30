//
//  MembersSectionHeaderView.swift
//  Karate
//
//  Created by fatih on 08/08/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import UIKit

final class MembersSectionHeaderView: UICollectionReusableView, ReusableView {
    private weak var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .tabBarGray
    }
    
    func bind(title: String) {
        buildTitleLabel(title: title)
    }
    
    @available (*, unavailable) required init(coder: NSCoder) { fatalError("") }
    
    private func buildTitleLabel(title: String) {
        let label: UILabel = {
            let l = UILabel()
            l.translatesAutoresizingMaskIntoConstraints = false
            l.text = title
            l.insert(into: self, with: .init(top: 0, left: 15, bottom: 0, right: 15))
            return l
        }()

        titleLabel = label
    }
}
