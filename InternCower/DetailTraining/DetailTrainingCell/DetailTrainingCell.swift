//
//  DetailTrainingCell.swift
//  InternCower
//
//  Created by Apple on 1/25/21.
//  Copyright © 2021 ThucTapSinh. All rights reserved.
//

import UIKit

class DetailTrainingCell: UITableViewCell {

    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var womanLabel: UILabel!
    @IBOutlet weak var totalLabels: UILabel!
    @IBOutlet weak var womanEmwLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupTextView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func setupTextView() {
        self.contentTextView.isEditable = false
        self.contentTextView.sizeToFit()
        self.contentTextView.translatesAutoresizingMaskIntoConstraints = true
        self.contentTextView.isScrollEnabled = false
        self.totalLabels.isHidden = true
        self.womanLabel.isHidden = true
        self.resultLabel.text = "Result:"
        setupLabel()
    }
    func setupLabel(){
        var arrayLabel: [UILabel] = [resultLabel,womanEmwLabel,womanLabel,totalLabels,numberLabel,createdLabel]
        for item in arrayLabel {
            item.font = .boldSystemFont(ofSize: 16)
        }
    }
}

extension UITextView {
    func adjustUITextViewHeight() {
        self.translatesAutoresizingMaskIntoConstraints = true
        self.sizeToFit()
        self.isScrollEnabled = false
        
    }
    
    
}
