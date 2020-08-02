//
//  FooterView.swift
//  flexApp
//
//  Created by zzc on 2020/8/2.
//  Copyright © 2020 zzc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


class FooterView: BaseView {
    
    var vm: FooterViewModel
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textColor = .red
        label.numberOfLines = 0
        return label
    }()
    
    lazy var picImageViewA: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var picImageViewB: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    
    init(_ viewModel: FooterViewModel) {
        
        self.vm = viewModel
        
        super.init(frame: CGRect.zero)
        
        updateView()
        defineLayout()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//    //从上到下布局
//    func defineLayout() {
//
//        var prevView = startPlaceView
//
//        titleLabel.createConstraint(containerView: self, prevView: &prevView, show: vm.showTitle()) { (make, prevView) in
//
//            make.top.equalTo(prevView.snp.bottom).offset(10)
//            make.left.equalTo(10)
//            make.right.equalTo(-10)
//
//        }
//
//        picImageViewA.createConstraint(containerView: self, prevView: &prevView, show: vm.showImageA()) { (make, prevView) in
//
//            make.top.equalTo(prevView.snp.bottom).offset(20)
//            make.centerX.equalTo(self)
//
//        }
//
//        picImageViewB.createConstraint(containerView: self, prevView: &prevView, show: vm.showImageB()) { (make, prevView) in
//
//            make.top.equalTo(prevView.snp.bottom).offset(30)
//            make.centerX.equalTo(self)
//
//        }
//
//        //必须设置底部约束，才能正确得出高度
//        endPlaceView.createConstraint(containerView: self, prevView: &prevView, show: true) { (make, prevView) in
//            make.top.equalTo(prevView.snp.bottom)
//            make.left.equalTo(0)
//            make.bottom.equalTo(-40)
//        }
//    }
//
    
    
    
    //从左到右布局
    func defineLayout() {

          var prevView = startPlaceView

          titleLabel.createConstraint(containerView: self, prevView: &prevView, show: vm.showTitle()) { (make, prevView) in
              
            make.left.equalTo(prevView.snp.right).offset(10)
               make.width.equalTo(100)
            make.centerY.equalTo(self)
   
    
          }
          
          picImageViewA.createConstraint(containerView: self, prevView: &prevView, show: vm.showImageA()) { (make, prevView) in
              
              make.left.equalTo(prevView.snp.right).offset(20)
              make.centerY.equalTo(self)
              
          }
          
          picImageViewB.createConstraint(containerView: self, prevView: &prevView, show: vm.showImageB()) { (make, prevView) in
              
              make.left.equalTo(prevView.snp.right).offset(30)
              make.centerY.equalTo(self)
              
          }
          
          //必须设置底部约束，才能正确得出高度
          endPlaceView.createConstraint(containerView: self, prevView: &prevView, show: true) { (make, prevView) in
            make.left.equalTo(prevView.snp.right)
              make.right.equalTo(-40)
          }
      }
}


extension FooterView {
    
    func updateView(title: String) {
        
        vm.title = title
        titleLabel.text = title
        defineLayout()
    }
    
    func updateView() {
        titleLabel.text = vm.title
        picImageViewA.image = vm.imageA
        picImageViewB.image = vm.imageB
        
    }
    
}

