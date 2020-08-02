//
//  ViewController.swift
//  flexApp
//
//  Created by zzc on 2020/7/31.
//  Copyright © 2020 zzc. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    
    var myHeaderView: HeaderView?
    
    var myFooterView: FooterView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //testHeader()
        
        testFooter()
    }
    
    
    func testHeader() {
        
        let headerView = HeaderView()
        myHeaderView = headerView
        
        self.view.addSubview(headerView)

        let oldsize = CGSize(width: 200, height: 10000)
        let size = headerView.sizeThatFits(oldsize)
        
        headerView.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.snp.bottom).offset(-100)
            make.size.equalTo(size)
            make.centerX.equalTo(self.view.snp.centerX)
            
        }
    }
    
    
    
//    func testFooter() {
//
//        let footerVM = FooterViewModel(title: "hello你好啊hello你好啊hello你好啊hello你好啊", imageA: UIImage(named: "icon70"), imageB: UIImage(named: "icon70"))
//        let footerView = FooterView(footerVM)
//
//        myFooterView = footerView
//        self.view.addSubview(footerView)
//
//        var frame: CGRect = .zero
//        frame.size = CGSize(width: 200, height: 0)
//        footerView.frame = frame
//
//        footerView.snp.makeConstraints { make in
//            make.bottom.equalTo(self.view.snp.bottom).offset(-100)
//            make.width.equalTo(200)
//            make.centerX.equalTo(self.view.snp.centerX)
//        }
//    }

    
    
    func testFooter() {
        
        let footerVM = FooterViewModel(title: "hello你好啊hello你好啊hello你好啊hello你好啊", imageA: UIImage(named: "icon70"), imageB: UIImage(named: "icon70"))
        let footerView = FooterView(footerVM)
       
        myFooterView = footerView
        self.view.addSubview(footerView)

        var frame: CGRect = .zero
        frame.size = CGSize(width: 0, height: 100)
        footerView.frame = frame
            
        footerView.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.snp.bottom).offset(-100)
            make.height.equalTo(200)
            make.centerX.equalTo(self.view.snp.centerX)
        }
    }
    

    @IBAction func changeTexdt(_ sender: Any) {

        myFooterView?.updateView(title: "hehe一下,我是谁，我再哪里，我要干什么?")

        
    }
    
    
    
    
}

