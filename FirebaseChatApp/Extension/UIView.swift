//
//  UIView.swift
//  FirebaseChatApp
//
//  Created by Nguyễn Xuân Nam on 8/5/19.
//  Copyright © 2019 Nguyễn Xuân Nam. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}
