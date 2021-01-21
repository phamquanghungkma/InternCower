//
//  TrainingCell.swift
//  InternCower
//
//  Created by TofuKma on 1/21/21.
//  Copyright © 2021 ThucTapSinh. All rights reserved.
//

import UIKit

class TrainingCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func setup(model: RealTime) {
        self.dateLabel.textColor = UIColor(named: "E4022D")
        self.dateLabel.font = UIFont.italicSystemFont(ofSize: 16)
        self.titleLabel.text = model.title
        self.dateLabel.text = "\(model.createdAt!)"
    }
}
