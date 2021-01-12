//
//  ReportVC.swift
//  InternCower
//
//  Created by TofuKma on 12/10/20.
//  Copyright © 2020 ThucTapSinh. All rights reserved.
//

import UIKit
import SideMenu

class ReportVC: UIViewController {
    var menu : SideMenuNavigationController?
    
    @IBOutlet weak var tableReport: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableReport.dataSource = self
        tableReport.delegate = self
//        tableReport.separatorColor = .clear
        tableReport.separatorStyle = .singleLine
        
        initLeftMenu()
        

        
    }
    func initLeftMenu(){
        menu = SideMenuNavigationController(rootViewController: MenuViewController())
        menu?.leftSide = true
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        SideMenuManager.default.leftMenuNavigationController = menu
        
        
        
    }
   
    
    @IBAction func didTouchMenu(_ sender: Any) {
        present(menu!, animated: true)
        
    }
    
   

}
extension ReportVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5

    }
//    var heightCells: [CGFloat] = []
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("ReportCell", owner: self, options:nil)?.first as!  ReportCell
      
        cell.labelReport.text = " FY 18/9 - T:4,5,6 "
        cell.labelReport.numberOfLines = 0
//        cell.labelReport.lineBreakMode = NSLineBreakMode.byWordWrapping
//        cell.labelReport.frame = CGRect(x: 0, y: 0, width: cell.labelReport.frame.width, height: CGFloat.greatestFiniteMagnitude)
//        cell.labelReport.sizeToFit()
//        heightCells.append(cell.title.frame.height)
        
        return cell
    
    }


}

extension ReportVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let activitiesVC =  ActivitiesVC()
        navigationController?.pushViewController(activitiesVC, animated: true)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}
