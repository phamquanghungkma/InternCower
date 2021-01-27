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
    @IBOutlet weak var attachmentLabel: UILabel!
    var dataDetail: DataDetail? {
        didSet {
            guard let activityRealtimeNara =  dataDetail?.activityRealTimeNarratives?.first else {
                return
            }
            guard let createdUser = dataDetail?.createdUser else {
                return
            }
            self.createdLabel.attributedText = setupLabels(title: "Created : ", content: createdUser.name ?? "")
            let total = activityRealtimeNara.total
            let totalWomen = activityRealtimeNara.totalWomen
            let totalEmw = activityRealtimeNara.totalEmw
            let amountSL = activityRealtimeNara.totalNumber
            let projectIndicator = activityRealtimeNara.projectIndicator
            let contentTV = projectIndicator?.name
            let beneficiaryType = projectIndicator?.measurementTypeBeneficiary
            let numberOfType = projectIndicator?.measurementTypeNumOf
                      if beneficiaryType == 1 {
                        self.totalLabels.attributedText = setupLabels(title: "Total: ", content: total ?? "")
                        self.womanLabel.attributedText = setupLabels(title: "Woman", content: totalWomen ?? "")
                        self.womanEmwLabel.attributedText = setupLabels(title: "Woman ", content: "(ethnic minority): \(totalEmw)")
                        self.totalLabels.text = total
                        self.beneficiaryType()
                      } else if beneficiaryType == 0 && numberOfType == 1 {
                        let amountAttributed = setupLabels(title: "Amount : ", content: amountSL ?? "")
                        self.numberLabel.attributedText = amountAttributed
                        self.contentTextView.text = contentTV
                        self.contentTextView.layoutIfNeeded()
                        self.numOfType()
                      }
        }
    }

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
        self.contentTextView.isScrollEnabled = false
        self.resultLabel.text = "Result :"
//        setupLabel()
    }
    func beneficiaryType() {
        self.numberLabel.isHidden = true
        self.attachmentLabel.isHidden = true
    }
    func numOfType() {
        self.totalLabels.isHidden = true
        self.womanLabel.isHidden = true
        self.womanEmwLabel.isHidden = true
    }
    func setupLabel() {
        let arrayLabel: [UILabel] = [resultLabel, womanEmwLabel, womanLabel, totalLabels, numberLabel, createdLabel, attachmentLabel]
        for item in arrayLabel {
            item.font = .boldSystemFont(ofSize: 16)
        }
    }
    
    func setupLabels(title:String, content: String) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
               paragraphStyle.alignment = .left
               paragraphStyle.firstLineHeadIndent = 0
                   let attributeBold: [NSAttributedString.Key: Any] = [
                       .font: UIFont.boldSystemFont(ofSize: 15),
                       .foregroundColor: UIColor.black,
                       .paragraphStyle: paragraphStyle
                          ]
                   let attributeRegular: [NSAttributedString.Key: Any] = [
                         .font: UIFont.systemFont(ofSize: 15),
                         .foregroundColor: UIColor.black,
                         .paragraphStyle: paragraphStyle
                     ]
               let attribute = NSMutableAttributedString()
               attribute.append(NSMutableAttributedString(string: title, attributes: attributeBold))
               attribute.append(NSMutableAttributedString(string: content, attributes: attributeRegular))
                return attribute
    }
}
