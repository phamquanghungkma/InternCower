//
//  ReportService.swift
//  InternCower
//
//  Created by TofuKma on 1/18/21.
//  Copyright © 2021 ThucTapSinh. All rights reserved.
//

import Foundation
import Alamofire

class ReportService {
    public static let shared: ReportService = ReportService()
    func getReportData(completion: @escaping((Result<ReportModels?, Error>) -> Void)) {
        let parameters: [String: Any] = [
            "sort": "year",
            "sort_2": "type",
            "lang": "vn",
            "token": Constants.tokenUser ?? "",
            "project_id": Constants.projectID ?? 0
        ]
        AF.request(ApiCommon.reportUrl, method: .get, parameters: parameters).validate(statusCode: 200..<300).responseJSON { response in
            switch response.result {
            case .success :
                guard let data = response.data else {
                    return
                }
                do {
                    let reportList = try JSONDecoder().decode(ReportModels.self, from: data)
                    completion(.success(reportList))
                } catch let e {
                    completion(.failure(e))
                }
            case .failure(let error) :
                completion(.failure(error))
            }
        }
    }
}
