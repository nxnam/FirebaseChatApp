//
//  ViewController.swift
//  FirebaseChatApp
//
//  Created by Nguyễn Xuân Nam on 8/3/19.
//  Copyright © 2019 Nguyễn Xuân Nam. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btn_LogIn(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "SingLogIn", bundle: nil)
        
        let srcSingLogIn = storyboard.instantiateViewController(withIdentifier: "SINGLOGIN")
        
        present(srcSingLogIn, animated: true)
        
    }
    
}
