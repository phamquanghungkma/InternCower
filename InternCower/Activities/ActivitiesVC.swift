//
//  ActivitiesVC.swift
//  InternCower
//
//  Created by TofuKma on 12/14/20.
//  Copyright © 2020 ThucTapSinh. All rights reserved.
//

import UIKit

class ActivitiesVC: BaseController {

    @IBOutlet weak var tableViewActivites: UITableView!
    var reportActivityResponse: [ReportActivityModel]?
    var count: Int?
    var report: ReportModel? {
        didSet {
            self.navigationItem.title = report?.reportName
        }
    }
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        callAPI()
        tableViewActivites.rowHeight = UITableView.automaticDimension
        tableViewActivites.separatorStyle = .singleLine
        tableViewActivites.dataSource = self
        tableViewActivites.delegate = self
        tableViewActivites.register(UINib(nibName: "ActivitiesCell", bundle: nil), forCellReuseIdentifier: "ActivitiesCell")
    }
    func callAPI() {
        guard let reportID = report?.reportID else {
            return
        }
        ReportActivityService.shared.fetchReportActivityData(reportID: reportID) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.reportActivityResponse = data
                    self.tableViewActivites.reloadData()
                }
            case .failure:
                    break
            }
        }
    }

}

//MARK: -Delegate/DataSource function
extension ActivitiesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let realTimes = reportActivityResponse?[indexPath.row].realTime
        let trainingVC = TrainingViewController()
        trainingVC.numberOfReport = realTimes?.count
        trainingVC.realTimeModel = realTimes
        self.show(trainingVC, sender: true)
    }
}
extension ActivitiesVC: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reportActivityResponse?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ActivitiesCell") as? ActivitiesCell {
            guard let listRepoertActivityModel = reportActivityResponse?[indexPath.row] else {
                return cell
            }
            guard let projectActivity = listRepoertActivityModel.projectActivity else {
                return cell
            }
            let realTimes = reportActivityResponse?[indexPath.row].realTime
            self.count = realTimes?.count
            cell.setup(model1: projectActivity, model2: count ?? 0)
            return cell
        }
        return UITableViewCell()
    }
}


