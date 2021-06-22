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
    @IBOutlet weak var collectionImageView: UIView!
    
//     let imageCollectionView: UIView = {
//        guard let imageCollectionView = Bundle.main.loadNibNamed(ImageCollectionView.identifier, owner: self, options: nil)?.first as? ImageCollectionView else {
//            return UIView()
//        }
//        imageCollectionView.setUpCollectionView()
//
//        return imageCollectionView
//    }()

 let imageCollectionView = Bundle.main.loadNibNamed(ImageCollectionView.identifier, owner: self, options: nil)?.first as? ImageCollectionView
    var documents:[String]?
    var dataDetail: DataDetail? {
        didSet {
            guard let activityRealtimeNara =  dataDetail?.activityRealTimeNarratives?.first else {
                return
            }
            guard let createdUser = dataDetail?.createdUser else {
                return
            }
            self.createdLabel.attributedText = setupLabels(title: "Created : ", content: createdUser.name ?? "")
            self.resultLabel.attributedText = setupLabels(title: "Result", content: "")
            let total = activityRealtimeNara.total
            let totalWomen = activityRealtimeNara.totalWomen
            let totalEmw = activityRealtimeNara.totalEmw
            let amountSL = activityRealtimeNara.totalNumber
            let projectIndicator = activityRealtimeNara.projectIndicator
            let contentTV = projectIndicator?.name
            let beneficiaryType = projectIndicator?.measurementTypeBeneficiary
            let numberOfType = projectIndicator?.measurementTypeNumOf
                      if beneficiaryType == 1 {
                        self.setUpBeneficiaryLabels(totalStr: total ?? "", womanStr: totalWomen ?? "", womanEmwStr: totalEmw ?? "")
                        self.beneficiaryType()
                      } else if beneficiaryType == 0 && numberOfType == 1 {
                        let amountAttributed = setupLabels(title: "Amount : ", content: amountSL ?? "")
                        self.numberLabel.attributedText = amountAttributed
                        self.contentTextView.text = contentTV
                        self.contentTextView.layoutIfNeeded()
                        self.numOfType()
                      }
            let documents = dataDetail?.documents ?? [""]
            self.imageCollectionView?.imageUrlList = documents
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupTextView()
        setUpDefautlLabel()
        imageCollectionView?.setUpCollectionView()
        imageCollectionView?.backgroundColor = .gray
        collectionImageView.addSubview(imageCollectionView!)
        imageCollectionView?.imageCollectionView.reloadData()
        imageCollectionView?.frame = collectionImageView.bounds
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func setupTextView() {
        self.contentTextView.isEditable = false
        self.contentTextView.isScrollEnabled = false
        self.contentTextView.font = UIFont.systemFont(ofSize: 16)
        contentTextView.translatesAutoresizingMaskIntoConstraints = false
        contentTextView.sizeToFit()
    }
    func beneficiaryType() {
        self.numberLabel.isHidden = true
        self.attachmentLabel.isHidden = true
    }
    func setUpBeneficiaryLabels(totalStr: String, womanStr: String, womanEmwStr: String) {
        self.totalLabels.attributedText = setupLabels(title: "Total: ", content: totalStr)
        self.womanLabel.attributedText = setupLabels(title: "Woman", content: womanStr)
        self.womanEmwLabel.attributedText = setupLabels(title: "Woman ", content: "(ethnic minority): \(womanEmwStr)")
    }
    func numOfType() {
        self.totalLabels.isHidden = true
        self.womanLabel.isHidden = true
        self.womanEmwLabel.isHidden = true
        self.attachmentLabel.attributedText = setupLabels(title: "Attachment", content: "")
    }
    func setUpDefautlLabel() {
        let arrayLabel: [UILabel] = [resultLabel, womanEmwLabel, womanLabel, totalLabels, numberLabel, createdLabel, attachmentLabel]
        for item in arrayLabel {
            item.font = .boldSystemFont(ofSize: 16)
        }
    }
    func setupLabels(title: String, content: String) -> NSAttributedString {
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
