//
//  DetailTrainingViewController.swift
//  InternCower
//
//  Created by Apple on 1/25/21.
//  Copyright © 2021 ThucTapSinh. All rights reserved.
//

import UIKit

class DetailTrainingViewController: UIViewController {
    var unitIndicators: UnitIndicators?
    var dataDetail: DataDetail? {
        didSet {
            guard let activityRealTime = dataDetail?.activityRealTimeNarratives?.first else {
                return
            }
            let createdTime = activityRealTime.createdAt
            self.dateLabel.attributedText = setupLabel(title: "Date: ", content: createdTime ?? "")
            guard let area = dataDetail?.area else {
                return
            }
            self.areaLabel.attributedText = setupLabel(title: "Area: ", content: handleFirstCol(contentString: area))
        }
    }
    var realTimeID: Int?
    var projectIndicator: ProjectIndicator?
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        callAPIDetailTraining()
    }
    func callAPIDetailTraining() {
        guard let realTimeID = realTimeID else {
            return
        }
        DetailTrainingService.shared.fetchDetailTrainingData(realTimeID: realTimeID) { result in
            switch result {
            case .success(let activityRealTimeNavList1) :
                    DispatchQueue.main.async {
                    self.dataDetail = activityRealTimeNavList1
                    self.myTableView.reloadData()
                }
            case .failure: break }
        }
    }
    func callIndicator() {
        UnitIndicatorService.shared.getIndicators { result in
                 switch result {
                 case .success(let unitIndicatorData):
                     DispatchQueue.main.async {
                         self.unitIndicators = unitIndicatorData
                         self.myTableView.reloadData()
                     }
                 case .failure: break
                 }
             }
    }
    func setupView() {
        setUpTableView()
    }
       func setupLabel(title: String, content: String) -> NSAttributedString {
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
    func setUpTableView() {
        myTableView.register(UINib(nibName: "DetailTrainingCell", bundle: nil), forCellReuseIdentifier: "DetailTrainingCell")
        myTableView.separatorStyle = .none
        myTableView.allowsSelection = false
    }
    func handleFirstCol(contentString: String) -> String {
           var handledString = contentString
           if !handledString.isEmpty && contentString.first == "," {
               handledString.remove(at: handledString.startIndex)
           } else {
               handledString = " " + handledString
           }
           return handledString
       }
//    func handleSpecialString(contenStr: String)-> String {
//        var handledStr = contenStr
//        
//    }


}

extension DetailTrainingViewController: UITableViewDelegate {
}
extension DetailTrainingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = myTableView.dequeueReusableCell(withIdentifier: "DetailTrainingCell") as? DetailTrainingCell {
            cell.dataDetail = self.dataDetail
            return cell
        }
        return UITableViewCell()
    }
}
