//
//  MembersInteractor.swift
//  Karate
//
//  Created by Little Frog on 6/2/19.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation
import UIKit

class MembersInteractor {
    private let router: MembersRouter!
    
    init(router: MembersRouter) {
        self.router = router
    }
    
    func viewModel() -> MembersViewModel {
        let sections: [MembersSection] = [
            MembersSection(
                members: [
                    MemberItem(
                        itemType: .coach,
                        item: MembersItemCellViewModel(
                            image: .placeholder,
                            name: "Coach who has very long name"
                        )
                    ),
                    MemberItem(
                        itemType: .coach,
                        item: MembersItemCellViewModel(
                            image: .placeholder,
                            name: "Coach2"
                        )
                    ),
                    MemberItem(
                        itemType: .coach,
                        item: MembersItemCellViewModel(
                            image: .placeholder,
                            name: "Coach3"
                        )
                    ),
                    MemberItem(
                        itemType: .coach,
                        item: MembersItemCellViewModel(
                            image: .placeholder,
                            name: "Coach3 also has verrry long name even longer than any other coach because he is crazy"
                        )
                    )
                ],
                sectionHeaderTitle: "COACHES"
            ),
            MembersSection(members:
                [
                    MemberItem(
                        itemType: .athlete,
                        item: MembersItemCellViewModel(
                            image: .placeholder,
                            name: "Athlete1"
                        )
                    ),
                    MemberItem(
                        itemType: .athlete,
                        item: MembersItemCellViewModel(
                            image: .placeholder,
                            name: "Athlete2"
                        )
                    ),
                    MemberItem(
                        itemType: .athlete,
                        item: MembersItemCellViewModel(
                            image: .placeholder,
                            name: "Athlete3"
                        )
                    ),
                    MemberItem(
                        itemType: .athlete,
                        item: MembersItemCellViewModel(
                            image: .placeholder,
                            name: "Athlete4"
                        )
                    )
                ],
                sectionHeaderTitle: "ATHLETES"
            )
        ]
    
        let didSelectItem: ((IndexPath) -> Void) = { [unowned self] index in
            let item = sections[index.section].members[index.item].item
            self.router.showCoachDetails()
        }
        
        return MembersViewModel(
            sections: sections,
            didSelect: didSelectItem
        )
    }
}
