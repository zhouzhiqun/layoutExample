//
//  UIViewConstraintsExtensions.swift
//  flexApp
//
//  Created by zzc on 2020/8/2.
//  Copyright © 2020 zzc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


extension UIView {
    
    func createConstraint(containerView: UIView, prevView: inout UIView, show: Bool, closure: (_ make: ConstraintMaker, _ prevView: UIView) -> Void) {
        
        self.removeFromSuperview()
        if !show {
            return
        }
        
        containerView.addSubview(self)
        self.snp.remakeConstraints { make in
            closure(make, prevView)
        }
        
        prevView = self
    }
}
