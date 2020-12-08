//
//  LoginVC.swift
//  InternCower
//
//  Created by TofuKma on 12/7/20.
//  Copyright © 2020 ThucTapSinh. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    static let identifier = "LoginVc"
    
    @IBOutlet weak var EmailTF: UITextField!
    
    @IBOutlet weak var PassTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        setUpView()
    }
    func setUpView(){
        self.EmailTF.placeholder = "Email"
               EmailTF.layer.borderWidth = 1.0
                  let myColor = UIColor.white
               EmailTF.layer.borderColor = myColor.cgColor
        
        self.PassTF.placeholder = "Password"
        PassTF.layer.borderWidth = 1.0
        PassTF.layer.borderColor = myColor.cgColor
        
    }


}
