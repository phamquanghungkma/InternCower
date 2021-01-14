//
//  UserModel.swift
//  InternCower
//
//  Created by TofuKma on 1/5/21.
//  Copyright © 2021 ThucTapSinh. All rights reserved.
//

import Foundation
struct User: Decodable {
    var token: String!
    var profile: Profile
}
struct Profile: Decodable {
    var name: String
    var email: String
    var id : Int
}
