//
//  MenuTableViewCell.swift
//  InternCower
//
//  Created by TofuKma on 1/13/21.
//  Copyright © 2021 ThucTapSinh. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var iCon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    func setup(model: MenuItemModel) {
        iCon.image = UIImage(named: model.image)
        iCon.frame.size = CGSize(width: 10, height: 10)
        titleLabel.text = model.title
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: model.type == .report ? 24 : 18)
        backgroundColor = UIColor.myBoldPurple
    }
}
