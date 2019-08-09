//
//  LogInViewController.swift
//  FirebaseChatApp
//
//  Created by Nguyễn Xuân Nam on 8/7/19.
//  Copyright © 2019 Nguyễn Xuân Nam. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class LogInViewController: UIViewController {

    @IBOutlet weak var txtView: UIView!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassWord: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        setupView()
    }
    
    @IBAction func btn_Login(_ sender: Any) {
        handleLogin()
    }
    
    func setupView() {
        txtView.layer.cornerRadius = 5
        
        btnLogin.layer.cornerRadius = 5
        
        self.txtEmail.becomeFirstResponder()
    }
    
    func handleLogin() {
        SVProgressHUD.show()
        
        guard let email = txtEmail.text, let password = txtPassWord.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            if error != nil {
                SVProgressHUD.dismiss()
                showAlert(title: "Lỗi Đăng Nhập", message: "Kiểm tra lại tài khoản hoặc mật khẩu của bạn", title_button: "Đồng ý")
                print("Error", error ?? "")
                return
            }
            
            SVProgressHUD.dismiss()
            
            print("Success", email)
            self.dismiss(animated: true, completion: nil)
            
        }
        
        func showAlert(title: String, message: String, title_button: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            let btn_Action = UIAlertAction(title: title_button, style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(btn_Action)
            
            self.present(alert, animated: true)
        }
        
    }

}
