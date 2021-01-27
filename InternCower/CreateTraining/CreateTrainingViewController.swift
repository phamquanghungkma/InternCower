//
//  CreateTrainingViewController.swift
//  InternCower
//
//  Created by Apple on 1/27/21.
//  Copyright © 2021 ThucTapSinh. All rights reserved.
//

import UIKit

class CreateTrainingViewController: UIViewController {

    @IBOutlet weak var tbView: UITableView!
    var section: CreateTrainingTableData!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    func setupView() {
        setupTableView()
    }
    func setupTableView() {
        
        tbView.register(UINib(nibName: "CreateTrainingHeaderCell", bundle: nil), forCellReuseIdentifier: "CreateTrainingHeaderCell")
        tbView.register(UINib(nibName: "CreateTrainingInputCell", bundle: nil), forCellReuseIdentifier: "CreateTrainingInputCell")
        tbView.register(UINib(nibName: "CreateTrainingAttachmentCell", bundle: nil), forCellReuseIdentifier: "CreateTrainingAttachmentCell")
        section = CreateTrainingTableData(tbView)
        tbView.delegate = section
        tbView.dataSource = section
        tbView.separatorStyle = .none
        section.delegate = self
    }

}
// demo delegate
extension CreateTrainingViewController:CreateTrainingSectionDelegate {
    func touchInput(type: CreateTrainingInputType) {
        print("Click vao \(type)")
    }
}
