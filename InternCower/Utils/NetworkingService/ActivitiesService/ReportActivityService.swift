//
//  ReportActivityService.swift
//  InternCower
//
//  Created by TofuKma on 1/20/21.
//  Copyright © 2021 ThucTapSinh. All rights reserved.
//

import Foundation
import Alamofire

class ReportActivityService {
    public static var shared = ReportActivityService()
    func fetchReportActivityData(reportID:Int,completion:@escaping((Result<[ReportActivityModel]?,Error>) -> Void)) {
        let parameters: [String: Any] = [
                      "lang": "vn",
                      "token": Constants.tokenUser ?? "",
                      "project_id": Constants.projectID ?? 0,
                      "id": reportID
                   ]
        AF.request(ApiCommon.reportActivityUrl, method: .get, parameters: parameters).validate(statusCode: 200..<300).responseJSON { response in
            switch response.result {
            case .success:
                guard let data = response.data else {
                    return
                }
                do {
                    var modelData = try JSONDecoder().decode(ResponseData.self, from: data)
                    let array = modelData.data?.reportActivity
                    modelData.data?.reportActivity = array?.filter {
                        $0.projectActivity != nil
                    }
                    for data in modelData.data!.reportActivity! {
                        print(data.projectActivity?.name)
                    }
                    let reportActivity = modelData.data
                    let reportActivityModel = reportActivity?.reportActivity
                    completion(.success(reportActivityModel))
                } catch let e {
                    completion(.failure(e))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
