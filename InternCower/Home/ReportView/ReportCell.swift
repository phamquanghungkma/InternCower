//
//  ReportCell.swift
//  InternCower
//
//  Created by TofuKma on 12/10/20.
//  Copyright © 2020 ThucTapSinh. All rights reserved.
//

import UIKit

class ReportCell: UITableViewCell {

    @IBOutlet weak var labelReport: UILabel!
    @IBOutlet weak var nextImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup(model: ReportModel) {
        labelReport.text = model.reportName
        labelReport.numberOfLines = 0
    }
}
