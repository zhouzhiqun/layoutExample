//
//  HeaderView.swift
//  flexApp
//
//  Created by zzc on 2020/8/2.
//  Copyright © 2020 zzc. All rights reserved.
//

import Foundation
import UIKit
import FlexLayout


extension Flex {
    
    @discardableResult
    func show(isShow: Bool) -> Display {
        if isShow {
            return Display.flex
        } else {
            return Display.none
        }
    }
}

class HeaderView: UIView {
    
    
    var title: String? = "hellowohelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldhelloworldrld"
    var image: UIImage? = UIImage(named: "icon70.png")
    var image2: UIImage? = UIImage(named: "icon70.png")
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = title
        label.font = .systemFont(ofSize: 20)
        label.textColor = .red
        label.numberOfLines = 0
        return label
    }()
    
    lazy var picImageView: UIImageView = {
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    lazy var picImageView2: UIImageView = {
        let imageView = UIImageView(image: image2)
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .gray
        defineLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func defineLayout() {
        
        self.flex.direction(.column).paddingBottom(10).define { flex in
            
            if showTitle() {
                addSubview(titleLabel)
                flex.addItem(titleLabel).marginTop(20).marginLeft(10).marginRight(10)
            } else {
                titleLabel.removeFromSuperview()
            }
            
            if showImage() {
                addSubview(picImageView)
                flex.addItem(picImageView).marginTop(10).alignSelf(.center)
            } else {
                picImageView.removeFromSuperview()
            }
            
            if showImage2() {
                addSubview(picImageView2)
                flex.addItem(picImageView2).marginTop(10).alignSelf(.center)
            } else {
                picImageView2.removeFromSuperview()
            }
            
        }
        self.flex.layout(mode: .adjustHeight)
        
    }
    
    
    func showTitle() -> Bool {
        return title != nil
    }
    
    func showImage() -> Bool {
        return image != nil
    }
    
    func showImage2() -> Bool {
        return image2 != nil
    }
    
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        self.frame.size = size
        self.flex.layout(mode: .adjustHeight)
        return self.frame.size
    }
    
    func updateView(title: String) {
        
        self.title = title
        titleLabel.text = title
        
        self.image = nil
        picImageView.image = nil
        
        self.image2 = nil
            picImageView2.image = nil
        
        titleLabel.flex.markDirty()
        picImageView.flex.markDirty()
        picImageView2.flex.markDirty()
        
        defineLayout()
       // flex.layout(mode: .adjustHeight)

    }
    
}
