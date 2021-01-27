//
//  DetailTrainingService.swift
//  InternCower
//
//  Created by TofuKma on 1/26/21.
//  Copyright © 2021 ThucTapSinh. All rights reserved.
//

import Foundation
import Alamofire

class DetailTrainingService {
    public static var shared: DetailTrainingService = DetailTrainingService()
    func fetchDetailTrainingData(realTimeID: Int, completion:@escaping((Result<DataDetail?,Error>)->Void)){
        let parameters: [String: Any] = [
            "lang": "vn",
            "token": Constants.tokenUser ?? "",
            "id": realTimeID
        ]
        AF.request(ApiCommon.detailTrainingUrl,method: .get,parameters: parameters).validate(statusCode: 200..<300).responseJSON { response in
            switch response.result {
            case .success:
                guard let data = response.data else {
                    return
                }
                do {
                    let detailTrainingResponse = try JSONDecoder().decode(DetailTrainingModel.self, from: data)
                    let dataDetailResponse = detailTrainingResponse.data
                completion(.success(dataDetailResponse))
                } catch let e {
                    completion(.failure(e))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
