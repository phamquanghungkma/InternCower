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
