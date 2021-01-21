//
//  ActivitiesCell.swift
//  InternCower
//
//  Created by TofuKma on 12/14/20.
//  Copyright © 2020 ThucTapSinh. All rights reserved.
//

import UIKit

class ActivitiesCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func setup(model1: ProjectActivity,model2:Int) {
        self.titleLabel.text = model1.name
        self.countLabel.text = "(\(model2))"
        self.countLabel.textColor = .red
    }
}
