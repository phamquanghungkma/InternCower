//
//  CreateTrainingInputCell.swift
//  InternCower
//
//  Created by Apple on 1/27/21.
//  Copyright © 2021 ThucTapSinh. All rights reserved.
//

import UIKit

class CreateTrainingInputCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var tfValue: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
       self.selectionStyle = .none
    }

    func setupData(model: CreateTrainingInputViewModel){
        self.lblName.text = model.name
        
        switch model.type {
            case .title, .distric , .city:
                if let value = model.value as? String {
                    self.tfValue.text = value
                }
            default:
                return
        }
        
    }
    
}
