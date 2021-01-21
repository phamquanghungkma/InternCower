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
    var reportActivity: [ReportActivityModel]?
    private enum CodingKeys: String, CodingKey {
        case reportActivity = "report_activity"
    }
}

struct ReportActivityModel: Decodable {
    var id: Int
    var reportId: Int
    var projectActivity: ProjectActivity?
    var realTime: [RealTime]?
    private enum CodingKeys: String, CodingKey {
        case projectActivity = "project_activity"
        case id
        case reportId = "report_id"
        case realTime = "real_time"
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
struct RealTime: Decodable {
    var id: Int
    var title: String
    var reportActivityID: Int
    var provinceID: Int?
    var districtID: Int?
    var communeID: Int?
    var villageID: Int?
    var createdAt: String?
    var startAt: String?
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case reportActivityID = "report_activity_id"
        case provinceID = "province_id"
        case districtID = "district_id"
        case communeID = "commune_id"
        case villageID = "village_id"
        case createdAt = "created_at"
        case startAt = "start_date"
    }
}
