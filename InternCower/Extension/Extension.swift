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
extension UIView {
    // this is a function
    // swiftlint:disable function_parameter_count
    func anchor(
        top:NSLayoutYAxisAnchor?,
        left:NSLayoutXAxisAnchor?,
        bottom:NSLayoutYAxisAnchor?,
        right:NSLayoutXAxisAnchor?,
        paddingTop:CGFloat,// gia tri
        paddingLeft:CGFloat,// gia tri
        paddingBottom:CGFloat,// gia tri
        paddingRight:CGFloat,// gia tri
        width:CGFloat,
        height:CGFloat
        ) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
