//
//  AppDelegate.swift
//  InternCower
//
//  Created by TofuKma on 12/7/20.
//  Copyright © 2020 ThucTapSinh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // tách ra thành hàm riêng
        let loginVc = LoginVC()
        getUserDefaultsData()
//        let reportVc =  Storyboard.view(identifier: "navigation")
        var rootVC: UIViewController?
        let status = UserDefaults.standard.bool(forKey: "isLogin")
        if status == true {
            rootVC = Storyboard.view(identifier: "navigation")
        } else {
            rootVC = loginVc
        }
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
        return true
    }
    func getUserDefaultsData() {
        Constants.tokenUser = UserDefaults.standard.string(forKey: KeyString.tokenUser)
        Constants.projectID = UserDefaults.standard.integer(forKey: KeyString.projectID)
        Constants.accountName = UserDefaults.standard.string(forKey: KeyString.accountName)
    }
}
