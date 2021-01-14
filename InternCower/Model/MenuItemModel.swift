//
//  MenuItemModel.swift
//  InternCower
//
//  Created by TofuKma on 1/13/21.
//  Copyright © 2021 ThucTapSinh. All rights reserved.
//

import Foundation

enum SideOption: String {
    case report = "REPORT"
    case guide = "Guide"
    case intro = "Introduction"
    case setting = "Setting"
    case logout = "Logout"
}

struct MenuItemModel {
    var image: String
    var title: String
    var type: SideOption
    init(image: String, title: String) {
        self.image = image
        self.title = title
        self.type = SideOption(rawValue: title)!
    }
}
