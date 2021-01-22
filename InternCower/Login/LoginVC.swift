//
//  LoginVC.swift
//  InternCower
//
//  Created by TofuKma on 12/7/20.
//  Copyright © 2020 ThucTapSinh. All rights reserved.
//

import UIKit
import Alamofire

class LoginVC: UIViewController {
    static let identifier = "LoginVc"

    // NAMDV comment: Sửa lại tên biến, đây không phải email
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailTextField.text = "PLLT001maikieulc"
        passwordTextField.text = "12345678"
        setUpView()
    }
    func setUpView() {
        // config UITextField
        configUITextField(textField: emailTextField)
        configUITextField(textField: passwordTextField)
        passwordTextField.isSecureTextEntry = true
        // config Button
        configButton()
    }
    func configUITextField(textField: UITextField) {
        let myColor = UIColor.white
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = myColor.cgColor
        textField.layer.cornerRadius = 22
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        //        textField.addTarget(self, action: #selector(formValidation), for: .editingChanged)
    }
    func configButton() {
        //        LoginButton.isEnabled = false
        loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    }
    @objc func handleLogin() {
        formValidation()
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        LoginService.shared.login(email, password) { result in
            switch result {
            case .success:
                    let reportVc =  Storyboard.view(identifier: "navigation")
                    reportVc.modalPresentationStyle = .fullScreen
                    self.show(reportVc, sender: nil)
            case .failure:
                break
            }

        }
    }
    func formValidation() {
        guard emailTextField.hasText, passwordTextField.hasText
            else {
                if !emailTextField.hasText && !passwordTextField.hasText {
                    // NAMDV comment: Task tạo alert này bị viết lại nhiều lần. Nên tạo function với những tham số đầu vào cần thiết để sử dụng. Tránh việc copy code.
                    let alert = UIAlertController(title: "Invalid", message: "Username and Password must not be empty", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                    present(alert, animated: false)
                    print("You must enter email and password")
                    return
                }
                if !emailTextField.hasText {
                    let alert = UIAlertController(title: "Invalid", message: "Username must not be empty", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                    present(alert, animated: false)
                    print("Email empty")
                    return
                }
                if !emailTextField.hasText {
                    let alert = UIAlertController(title: "Invalid", message: " Password must not be empty", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                    present(alert, animated: false)
                    print("Pass empty")
                    return
                }
            // NAMDV comment: Sao lại return ở chỗ này?
                return
        }
        print("Login button is called")
        // NAMDV comment: Sao lại return ở chỗ này?
        return
    }
}
