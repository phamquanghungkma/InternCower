//
//  ReportVC.swift
//  InternCower
//
//  Created by TofuKma on 12/10/20.
//  Copyright © 2020 ThucTapSinh. All rights reserved.
//

import UIKit

class ReportVC: UIViewController {
    
    @IBOutlet weak var tableReport: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableReport.dataSource = self
        tableReport.delegate = self
        
        
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
        cell.labelReport.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.labelReport.frame = CGRect(x: 0, y: 0, width: cell.labelReport.frame.width, height: CGFloat.greatestFiniteMagnitude)
        cell.labelReport.sizeToFit()
//        heightCells.append(cell.title.frame.height)
        
        return cell
    
    }


}

extension ReportVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
}
