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

    @IBOutlet weak var LoginButton: UIButton!
    
    @IBOutlet weak var PassTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setUpView()
    }
    func setUpView(){
        // config UITextField
        
        configUITextField(textField: EmailTF)
        configUITextField(textField: PassTF)
        PassTF.isSecureTextEntry = true
        // config Button
        configButton()
        
        
    }
    func configUITextField(textField: UITextField){
        let myColor = UIColor.white
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = myColor.cgColor
        textField.layer.cornerRadius = 22
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        //        textField.addTarget(self, action: #selector(formValidation), for: .editingChanged)
        
    }
    
    func configButton(){
        //        LoginButton.isEnabled = false
        LoginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        
    }
    
    
    
    
    @objc func handleLogin(){
            formValidation()
            print("Next")
        
        
    }
    
    
     func formValidation() {
     
        guard EmailTF.hasText, PassTF.hasText
            else {
               
                if(!EmailTF.hasText && !PassTF.hasText){
                    let alert = UIAlertController(title: "Invalid", message: "Username and Password must not be empty", preferredStyle: .alert)
                    present(alert, animated: false)
                    print("You must enter email and password")
                    return
                }
                if(!EmailTF.hasText){
                    let alert = UIAlertController(title: "Invalid", message: "Username must not be empty", preferredStyle: .alert)
                    present(alert, animated: false)
                    print("Email empty")
                    return
                }
                if(!PassTF.hasText){
                    let alert = UIAlertController(title: "Invalid", message: " Password must not be empty", preferredStyle: .alert)
                    present(alert, animated: false)
                    print("Pass empty")
                    return
                }
                return
        }
        
        print("Login button is called")
        return
        
    }
    
    
}
