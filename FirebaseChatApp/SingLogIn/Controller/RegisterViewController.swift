//
//  RegisterViewController.swift
//  FirebaseChatApp
//
//  Created by Nguyễn Xuân Nam on 8/7/19.
//  Copyright © 2019 Nguyễn Xuân Nam. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {
    
    let urlDatabase = "https://fir-chatapp-64c59.firebaseio.com/"
    
    @IBOutlet weak var txtView: UIView!
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassWord: UITextField!
    
    @IBOutlet weak var btnRegister: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    
    @IBAction func btn_Register(_ sender: Any) {
        handleRegister()
    }
    
    func handleRegister() {
        SVProgressHUD.show()
        
        guard let name = txtName.text , let email = txtEmail.text, let password = txtPassWord.text else { return }
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                print("Error", error ?? "")
                SVProgressHUD.dismiss()
                return
            }
            
            let ref = Database.database().reference(fromURL: self.urlDatabase).child("users").child(uid)
            let value = ["name": name, "email": email, "password": password]
            
            ref.updateChildValues(value, withCompletionBlock: { (err, ref) in
                
                if err != nil {
                    print("Error", err ?? "")
                    SVProgressHUD.dismiss()
                    return
                }
                
                print("Success", name)
                SVProgressHUD.dismiss()
                self.dismiss(animated: true, completion: nil)
                
            })
        }
    }
    
    func setupView() {
        txtView.layer.cornerRadius = 5
        
        btnRegister.layer.cornerRadius = 5
    }
}
