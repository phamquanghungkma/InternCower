//
//  loginService.swift
//  InternCower
//
//  Created by TofuKma on 1/5/21.
//  Copyright © 2021 ThucTapSinh. All rights reserved.
//

import Foundation
import Alamofire

class LoginService {
    public static let shared: LoginService = LoginService()
    
    func login(_ username:String,_ password: String , completion: @escaping (Result<Any?, ErrorMessage>) ) -> Void {
        
        let parameters: [String: Any] = [
                   "username": username,
                   "password": password,
                   "lang": "vn",
                   "mobile": 1
            ]
    
        AF.request(ApiCommon.LOGIN_URL,method: .post, parameters: parameters).responseJSON { response in
            
        }
        
        
        
    }
    
    
    
    
    
}
