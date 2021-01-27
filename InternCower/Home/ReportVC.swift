//
//  ReportVC.swift
//  InternCower
//
//  Created by TofuKma on 12/10/20.
//  Copyright © 2020 ThucTapSinh. All rights reserved.
//

import UIKit
import SideMenu

class ReportVC: BaseController {
    var menu: SideMenuNavigationController?
    var reportModels: ReportModels?
    @IBOutlet weak var tableReport: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableReport.dataSource = self
        tableReport.delegate = self
//        tableReport.separatorColor = .clear
        tableReport.separatorStyle = .singleLine
        tableReport.register(UINib(nibName: "ReportCell", bundle: nil), forCellReuseIdentifier: "ReportCell")
        initLeftMenu()
        callAPIFetchData()
        
       let vc =  CreateTrainingViewController(nibName: "CreateTrainingViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
}
    func initLeftMenu() {
        menu = SideMenuNavigationController(rootViewController: MenuViewController())
        var settingMenu = SideMenuSettings()
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: true)
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        SideMenuManager.default.leftMenuNavigationController = menu
        settingMenu.menuWidth = 240
        settingMenu.statusBarEndAlpha = 0
        settingMenu.presentationStyle.presentingEndAlpha = 0.5
        menu?.settings = settingMenu
    }
    @IBAction func didTouchMenu(_ sender: Any) {
        present(menu!, animated: true)
    }
    func callAPIFetchData() {
         ReportService.shared.getReportData { result in
                switch result {
                case .success(let reportListData):
                    DispatchQueue.main.async {
                        self.reportModels = reportListData
                        self.tableReport.reloadData()
                    }
                case .failure:
                    break
            }
        }
    }
}

extension ReportVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reportModels?.reportList.count ?? 0

    }
//    var heightCells: [CGFloat] = []
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ReportCell") as? ReportCell {
            guard let item = reportModels?.reportList[indexPath.row] else { return cell }
            cell.setup(model: item)
            //        cell.labelReport.lineBreakMode = NSLineBreakMode.byWordWrapping
            //        cell.labelReport.frame = CGRect(x: 0, y: 0, width: cell.labelReport.frame.width, height: CGFloat.greatestFiniteMagnitude)
            //        cell.labelReport.sizeToFit()
            //        heightCells.append(cell.title.frame.height)
            return cell
        }
        return UITableViewCell()
    }
}

extension ReportVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let activitiesVC =  ActivitiesVC()
        guard let report = reportModels?.reportList[indexPath.row] else {
            return
        }
        activitiesVC.report = report
        self.show(activitiesVC, sender: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
