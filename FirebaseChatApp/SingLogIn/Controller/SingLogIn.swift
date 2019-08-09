//
//  SingLogIn.swift
//  FirebaseChatApp
//
//  Created by Nguyễn Xuân Nam on 8/3/19.
//  Copyright © 2019 Nguyễn Xuân Nam. All rights reserved.
//

import UIKit
import Firebase

class SingLogIn: UIViewController {
    
    
    @IBOutlet weak var loginView: UIView!
    
    @IBOutlet weak var registerView: UIView!
    
    @IBOutlet weak var segmentView: UISegmentedControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSegmentView()
    }
    
   override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func changeView(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            registerView.alpha = 1
            loginView.alpha = 0
            break
        case 1:
            loginView.alpha = 1
            registerView.alpha = 0
            break
        default:
            break
        }
    }
    
    func setupSegmentView() {
        let font = UIFont.systemFont(ofSize: 20)
        segmentView.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
    }
}
