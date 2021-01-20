//
//  ReportActivityModel.swift
//  InternCower
//
//  Created by TofuKma on 1/20/21.
//  Copyright © 2021 ThucTapSinh. All rights reserved.
//

import Foundation

struct ResponseData: Decodable {
    var data: ReportActivityData?
    private enum CodingKeys: String, CodingKey {
        case data
    }
}
struct ReportActivityData: Decodable {
    var reportActivity: [ReportActivityModel]
    private  enum CodingKeys: String, CodingKey {
        case reportActivity = "report_activity"
    }
}

struct ReportActivityModel: Decodable {
    var id: Int
    var reportId: Int
    var projectActivity: ProjectActivity?
    private enum CodingKeys: String, CodingKey {
        case projectActivity = "project_activity"
        case id
        case reportId = "report_id"
    }
}
struct ProjectActivity: Decodable {
    var name:String
    var id: Int
    private enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
