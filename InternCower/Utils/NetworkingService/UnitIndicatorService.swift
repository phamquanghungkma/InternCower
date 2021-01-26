//
//  UnitIndicatorService.swift
//  InternCower
//
//  Created by Apple on 1/26/21.
//  Copyright © 2021 ThucTapSinh. All rights reserved.
//

import Foundation
import Alamofire
class UnitIndicatorService {
    public static let shared: UnitIndicatorService = UnitIndicatorService()
    func getIndicators(completion:@escaping((Result<UnitIndicators?,Error>)-> Void)){
        let parameters: [String:Any] = [
            "token": Constants.tokenUser ?? "",
            "lang": "vn"
        ]
        AF.request(ApiCommon.uinitIndicatorUrl,method: .get,parameters: parameters).validate(statusCode:200..<300).responseJSON { response in
            switch response.result {
            case .success:
                guard let data = response.data else {
                    return
                }
                do {
                    let uinitIndicator = try JSONDecoder().decode(UnitIndicators.self, from: data)
                    print("unit",uinitIndicator)
                    completion(.success(uinitIndicator))
                } catch let e {
                    completion(.failure(e))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
