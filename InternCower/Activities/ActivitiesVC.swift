//
//  ActivitiesVC.swift
//  InternCower
//
//  Created by TofuKma on 12/14/20.
//  Copyright © 2020 ThucTapSinh. All rights reserved.
//

import UIKit

class ActivitiesVC: UIViewController {

    @IBOutlet weak var tableViewActivites: UITableView!
    var reportActivityResponse: ResponseData?
    var report: ReportModel? {
        didSet {
            self.navigationItem.title = report?.reportName
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        callAPI()
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
            case .failure( _):
                    break;
            }
        }
    }

}

//MARK: -Delegate/DataSource function
extension ActivitiesVC: UITableViewDelegate {
}
extension ActivitiesVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ActivitiesCell") as? ActivitiesCell {
            return cell
        }
        return UITableViewCell()
    }
}
