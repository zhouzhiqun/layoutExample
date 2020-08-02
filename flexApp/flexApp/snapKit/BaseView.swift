//
//  BaseView.swift
//  flexApp
//
//  Created by zzc on 2020/8/2.
//  Copyright © 2020 zzc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


class BaseView: UIView {
    
    //起始和结束的占位view
    let startPlaceView = UIView()
    let endPlaceView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(startPlaceView)
        addSubview(endPlaceView)
        
        //位于左上角
        startPlaceView.snp.makeConstraints { make in
            make.top.left.equalTo(0)
            make.size.equalTo(CGSize.zero)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
