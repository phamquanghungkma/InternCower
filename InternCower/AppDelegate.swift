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
//        let loginVc = LoginVC()
        
        let reportVc =  Storyboard.view(identifier: "navigation")
     
        window?.rootViewController = reportVc
        window?.makeKeyAndVisible()
        return true
    }
}

