//
//  loginService.swift
//  InternCower
//
//  Created by TofuKma on 1/5/21.
//  Copyright © 2021 ThucTapSinh. All rights reserved.
//

import Foundation
import Alamofire


//PLLT001maikieulc
//12345678
class LoginService {
    public static let shared: LoginService = LoginService()
    
    func login(_ username:String,_ password: String , completion: @escaping( (Result<User?,Error>) -> Void ))  {
        
        let parameters: [String: Any] = [
            "username": username,
            "password": password,
            "lang": "vn",
            "mobile": 1
        ]
        AF.request(ApiCommon.LOGIN_URL,method: .post, parameters: parameters).validate(statusCode: 200..<300).responseJSON { response in
            switch response.result {
            case .success :
                print(response)
                guard let data = response.data else {
                    return
                }
                do {
                    let user = try JSONDecoder().decode(User.self, from: data)
                    let accessToken = user.token
                    UserDefaults.standard.setValue(true, forKey: "isLogin")
                    UserDefaults.standard.setValue(accessToken, forKey: "Token")
                    completion(.success(user))
                } catch let e {
                    print(e.localizedDescription);
                    completion(.failure(e))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        
        }
      
    }
    
  
}
