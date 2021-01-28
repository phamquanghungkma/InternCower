//
//  DetailTrainingModel.swift
//  InternCower
//
//  Created by TofuKma on 1/26/21.
//  Copyright © 2021 ThucTapSinh. All rights reserved.
//

import Foundation

struct DetailTrainingModel: Decodable {
    var data: DataDetail?
    private enum CodingKeys: String, CodingKey {
        case data
    }
}

struct DataDetail: Decodable {
    var activityRealTimeNarratives: [ActivityRealTimeNarravite]?
    var area: String?
    var createdAt: String?
    var updatedAt: String?
    var createdUser: CreatedUser?
    var caption: String?
    private enum CodingKeys: String, CodingKey {
        case activityRealTimeNarratives = "activity_realtime_narrative"
        case area
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case createdUser = "created_user"
        case caption
        
    }
}

struct ActivityRealTimeNarravite: Decodable {
    var id: Int
    var total: String?
    var totalWomen: String?
    var totalEmw: String?
    var totalNumber: String?
    var createdAt: String?
    var updatedAt: String?
    var projectIndicator: ProjectIndicator?
    private enum CodingKeys: String, CodingKey {
        case id
        case total
        case totalWomen =  "total_women"
        case totalEmw = "total_emw"
        case totalNumber = "total_number"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case projectIndicator = "project_indicator"
    }
}

struct ProjectIndicator: Decodable {
    var id: Int
    var name: String
    var measurementTypeBeneficiary: Int
    var measurementTypeNumOf: Int
    var tagetNumber: String
    var targetUnit: Int
    var targetTotal: Int
    var targetWomen: Int
    var targetEmw: Int
    var frequency: Int
    var annualTargets: [AnnualTarget]?
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case measurementTypeBeneficiary =  "measurement_type_beneficiary"
        case measurementTypeNumOf  = "measurement_type_num_of"
        case tagetNumber = "target_number"
        case targetUnit = "target_unit"
        case targetTotal = "target_total"
        case targetWomen = "target_women"
        case targetEmw = "target_emw"
        case frequency
        case annualTargets = "annual_targets"
    }
}

struct AnnualTarget: Decodable {
    var id: Int
    var year: Int
    private enum CodingKeys: String, CodingKey {
        case id
        case year
    }
}
struct CreatedUser: Decodable {
    var username: String
    var name: String
    var phone: String?
}
