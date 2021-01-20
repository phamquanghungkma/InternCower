//
//  loginService.swift
//  InternCower
//
//  Created by TofuKma on 1/5/21.
//  Copyright © 2021 ThucTapSinh. All rights reserved.
//

import Foundation
import Alamofire

// PLLT001maikieulc
// 12345678
class LoginService {
    public static let shared: LoginService = LoginService()
    func login(_ username: String, _ password: String, completion: @escaping( (Result<User?, Error>) -> Void )) {
        let parameters: [String: Any] = [
            "username": username,
            "password": password,
            "lang": "vn",
            "mobile": 1
        ]
        AF.request(ApiCommon.loginUrl, method: .post, parameters: parameters).validate(statusCode: 200..<300).responseJSON { response in
            switch response.result {
            case .success :
//                print(response)
                guard let data = response.data else {
                    return
                }
                do {
                    let user = try JSONDecoder().decode(User.self, from: data)
                    Constants.accountName = user.profile.name
                    Constants.tokenUser = user.token
                    Constants.projectID = user.profile.project.id
                    UserDefaults.standard.setValue(true, forKey: KeyString.isLogin)
                    UserDefaults.standard.setValue(Constants.tokenUser, forKey: KeyString.tokenUser)
                    UserDefaults.standard.setValue(Constants.accountName, forKey: KeyString.accountName)
                    UserDefaults.standard.setValue(Constants.projectID, forKey: KeyString.projectID)
                    completion(.success(user))
                } catch let e {
                    print(e.localizedDescription)
                    completion(.failure(e))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

struct KeyString {
    static let isLogin = "isLogin"
    static let tokenUser = "Token"
    static let projectID = "projectID"
    static let accountName = "accountName"
}

extension String {
    static var isLogin = "isLogin"
}
