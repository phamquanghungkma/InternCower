//
//  TrainingViewController.swift
//  InternCower
//
//  Created by TofuKma on 1/21/21.
//  Copyright © 2021 ThucTapSinh. All rights reserved.
//

import UIKit

class TrainingViewController: UIViewController {

    @IBOutlet weak var buttonAddNew: UIButton!
    @IBOutlet weak var reportLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var mytableView: UITableView!
    var realTimeModel: [RealTime]?
    var numberOfReport: Int?
    override func viewDidLoad() {
        super.viewDidLoad()

        mytableView.delegate = self
        mytableView.dataSource = self
        setupView()
        mytableView.register(UINib(nibName: "TrainingCell", bundle: nil), forCellReuseIdentifier: "TrainingCell")
    }
    @IBAction func didTouchAddNewButton(_ sender: Any) {
        let vc =  CreateTrainingViewController(nibName: "CreateTrainingViewController", bundle: nil)
               self.navigationController?.pushViewController(vc, animated: true)
    }
    func setupView() {
        self.buttonAddNew.layer.cornerRadius = 24
        self.reportLabel.text = "Report"
        self.numberLabel.text = String(format: "(%d)", numberOfReport!)
    }

}

extension TrainingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let realtimeID = realTimeModel?[indexPath.row].id else {
            return
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let detailTrainingVC = storyboard.instantiateViewController(withIdentifier: "DetainTrainingVC") as! DetailTrainingViewController
        guard let detailTrainingVC = storyboard.instantiateViewController(withIdentifier: "DetainTrainingVC") as? DetailTrainingViewController else {
            return
        }
        detailTrainingVC.realTimeID = realtimeID
        self.show(detailTrainingVC, sender: nil)
    }
}
extension TrainingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realTimeModel!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = mytableView.dequeueReusableCell(withIdentifier: "TrainingCell") as? TrainingCell {
            guard let item = realTimeModel?[indexPath.row] else {
                return cell
            }
            cell.setup(model: item)
            return cell
        }
        return UITableViewCell()
    }
}
