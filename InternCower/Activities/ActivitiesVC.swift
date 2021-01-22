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
    var numberOfRow: Int? // NAMDV comment: biến này bị thừa
    var report: ReportModel? {
        didSet {
            self.navigationItem.title = report?.reportName
        }
    }
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        callAPI()

        // NAMDV comment: khai báo tableView nên tách ra function
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
                    // NAMDV comment: Xử lý TH mảng rỗng
                    self.tableViewActivites.reloadData()
                }
                // NAMDV comment: Sửa warnings
            case .failure( _):
                // NAMDV comment: Xử lý TH lỗi (vd: hiển thị dialog)
                    break;
            }
        }
    }

}

//MARK: -Delegate/DataSource function
extension ActivitiesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
        
            cell.setup(model: projectActivity)
            return cell
        }
        return UITableViewCell()
    }
}


