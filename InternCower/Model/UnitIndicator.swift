//
//  UnitIndicator.swift
//  InternCower
//
//  Created by Apple on 1/25/21.
//  Copyright © 2021 ThucTapSinh. All rights reserved.
//

import Foundation

struct UnitIndicators: Decodable {
    var indicatorList = [UnitIndicator]()
    private enum CodingKeys: String, CodingKey {
        case indicatorList = "data"
    }
}

struct UnitIndicator: Decodable {
    var type: Int
    var name: String
    var code: String
}

