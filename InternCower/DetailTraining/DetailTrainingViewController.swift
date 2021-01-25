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
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTableView()
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
    func setUpTableView(){
        myTableView.register(UINib(nibName: "DetailTrainingCell", bundle: nil), forCellReuseIdentifier: "DetailTrainingCell")
    }

}

extension DetailTrainingViewController: UITableViewDelegate{
}
extension DetailTrainingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = myTableView.dequeueReusableCell(withIdentifier: "DetailTrainingCell") as? DetailTrainingCell {
            return cell
        }
        return UITableViewCell()
    }
}
