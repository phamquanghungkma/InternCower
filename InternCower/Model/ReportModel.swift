//
//  ReportModel.swift
//  InternCower
//
//  Created by TofuKma on 1/19/21.
//  Copyright © 2021 ThucTapSinh. All rights reserved.
//

import Foundation

struct ReportModels: Decodable {
    var reportList = [ReportModel]()
    private enum CodingKeys: String, CodingKey {
        case reportList = "data"
    }
}

struct ReportModel: Decodable {
    var reportID: Int
    var reportName: String
    private enum CodingKeys: String, CodingKey {
        case reportID = "id"
        case reportName = "name"
    }
}
