//
//  apiConstant.swift
//  InternCower
//
//  Created by TofuKma on 12/9/20.
//  Copyright © 2020 ThucTapSinh. All rights reserved.
//

import Foundation

struct ApiCommon {
    // MARK: - rootAPI
    static let baseUrl: String = "https://cowater.grooo.com.vn/api"
    // MARK: Handle Authen and Login
    static let loginUrl: String = "\(baseUrl)/users/login"
    static let logoutUrl: String = ""
    static let registerUrl: String = ""
}
