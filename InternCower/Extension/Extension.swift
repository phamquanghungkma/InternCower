//
//  Extension.swift
//  InternCower
//
//  Created by TofuKma on 12/10/20.
//  Copyright © 2020 ThucTapSinh. All rights reserved.
//

import UIKit

typealias Storyboard = UIStoryboard
extension UIStoryboard {
    static func view(identifier: String) -> UIViewController {
        let storyboard = Storyboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
}
extension UIColor {
    static var myBoldPurple =  UIColor(named: "232F5D")!
    static var myPurple = UIColor(named: "424E7D")!
    static var myGray = UIColor(named: "F7F8F8")!
    static var myGrey = UIColor(named: "444444")!
    static var myYellow = UIColor(named: "E89B15")!
    static var myXam = UIColor(named: "B7B7B7")!
}
