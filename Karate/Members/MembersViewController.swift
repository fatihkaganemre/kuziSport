//
//  MembersViewController.swift
//  Karate
//
//  Created by Little Frog on 6/2/19.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation
import UIKit

struct MembersSection {
    let members: [MemberItem]
    let sectionHeaderTitle: String
}

struct MemberItem {
    let itemType: MemberItemType
    let item: MembersItemCellViewModel
}

enum MemberItemType {
    case coach
    case athlete
}

struct MembersViewModel {
    let sections: [MembersSection]
    let didSelect: ((IndexPath) -> Void)
}

class MembersViewController: UIViewController {
    private weak var headerImageView: UIImageView!
    private weak var collectionView: UICollectionView!
    private weak var headerViewHeightConstraint: NSLayoutConstraint!
    private let headerViewMaxHeight: CGFloat = 250
    private let headerViewMinHeight: CGFloat = 100
    private let interactor: MembersInteractor!
    private let viewModel: MembersViewModel
    
    @available (*, unavailable) required init(coder: NSCoder) { fatalError("") }
    
    init(interactor: MembersInteractor) {
        self.interactor = interactor
        self.viewModel = interactor.viewModel()
        super.init(nibName: nil, bundle: nil)
        buildHeaderImageView()
        buildCollectionView()
    }
    
    private func buildHeaderImageView() {
        let imageView: UIImageView = {
            let iv = UIImageView()
            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.contentMode = .scaleAspectFill
            iv.image = UIImage(named: "membersHeaderImage")!
            return iv
        }()
        
        view.addSubview(imageView)
        headerViewHeightConstraint = imageView.heightAnchor
            .constraint(equalToConstant: headerViewMaxHeight)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerViewHeightConstraint
        ])
        
        self.headerImageView = imageView
    }
    
    private func buildCollectionView() {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: topAlignedCollectionViewFlowLayout()
        )
        collectionView.allowsMultipleSelection = false
        collectionView.allowsSelection = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(MembersItemCell.self)
        collectionView.registerHeader(MembersSectionHeaderView.self)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: headerImageView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        self.collectionView = collectionView
    }
    
    private func topAlignedCollectionViewFlowLayout() -> TopAlignedCollectionViewFlowLayout {
        let layout = TopAlignedCollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 15
        layout.sectionHeadersPinToVisibleBounds = true
        layout.sectionInsetReference = .fromContentInset
        return layout
    }
}

extension MembersViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.sections[section].members.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = viewModel.sections[indexPath.section]
        let member = section.members[indexPath.item]
        let cell: MembersItemCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.bind(with: member.item)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard case .coach = viewModel.sections[indexPath.section]
            .members[indexPath.item]
            .itemType else {
                return
        }
        viewModel.didSelect(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: 30.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard case UICollectionView.elementKindSectionHeader = kind else { return .init() }
        let headerView: MembersSectionHeaderView = collectionView.dequeueReusableSupplementeryView(
            ofKind: kind,
            forIndexPath: indexPath
        )
        let title = viewModel.sections[indexPath.section].sectionHeaderTitle
        headerView.bind(title: title)
        return headerView
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let newHeight = headerViewHeightConstraint.constant - scrollView.contentOffset.y
        
        if newHeight > headerViewMaxHeight {
            headerViewHeightConstraint.constant = headerViewMaxHeight
        } else if newHeight < headerViewMinHeight {
            headerViewHeightConstraint.constant = headerViewMinHeight
        } else {
            headerViewHeightConstraint.constant = newHeight
            scrollView.contentOffset.y = 0
        }
    }
}

private class TopAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attributes = super.layoutAttributesForElements(in: rect) else { return nil }
        attributes.filter { $0.representedElementCategory == .cell }
            .reduce([:]) {
                $0.merging([ceil($1.center.y): [$1]]) {
                    $0 + $1
                }
            }
            .values.forEach { line in
                let maxHeightY = line.max {
                    $0.frame.size.height < $1.frame.size.height
                }?.frame.origin.y
                
                line.forEach {
                    $0.frame = $0.frame.offsetBy(
                        dx: 0,
                        dy: (maxHeightY ?? $0.frame.origin.y) - $0.frame.origin.y
                    )
                }
            }
        
        return attributes
    }
}
