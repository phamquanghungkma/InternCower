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
    var activityRealTimeNavList: [ActivityRealTimeNarravite]?
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
                                   self.activityRealTimeNavList = activityRealTimeNavList1
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
                 case .failure(_): break
                 }
             }
    }
    func setupView(){
        setUpTableView()
        setupLabel(title: "Date :", content:"2012-01-21 01:51:01")
    }
    
    func setupLabel(title:String, content: String){
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
               self.dateLabel.attributedText = attribute
    }
    
    func setUpTableView(){
        myTableView.register(UINib(nibName: "DetailTrainingCell", bundle: nil), forCellReuseIdentifier: "DetailTrainingCell")
        myTableView.separatorStyle = .none
        myTableView.allowsSelection = false
    }

}

extension DetailTrainingViewController: UITableViewDelegate {
}
extension DetailTrainingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = myTableView.dequeueReusableCell(withIdentifier: "DetailTrainingCell") as? DetailTrainingCell {
            print("dulieuLa",self.activityRealTimeNavList?.first)
            cell.activityRealTimeNavList = self.activityRealTimeNavList?.first
            return cell
        }
        return UITableViewCell()
    }
}
