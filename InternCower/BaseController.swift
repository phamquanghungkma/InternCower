//
//  BaseController.swift
//  InternCower
//
//  Created by Apple on 1/20/21.
//  Copyright © 2021 ThucTapSinh. All rights reserved.
//

import UIKit

class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem?.tintColor = .white
        self.navigationController?.navigationBar.isTranslucent = true
    }
    override func viewWillAppear(_ animated: Bool) {
    }
}
