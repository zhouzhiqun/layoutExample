//
//  FooterViewModel.swift
//  flexApp
//
//  Created by zzc on 2020/8/2.
//  Copyright © 2020 zzc. All rights reserved.
//

import Foundation
import UIKit

struct FooterViewModel {
    
    var title: String?
    var imageA: UIImage?
    var imageB: UIImage?
    
    init() {
        
    }
    
    init(title: String?, imageA: UIImage?, imageB: UIImage?) {
        self.title = title
        self.imageA = imageA
        self.imageB = imageB
    }
    
    func showTitle() -> Bool {
        return title != nil && (title?.count ?? 0) > 0
    }
    
    func showImageA() -> Bool {
        return imageA != nil
    }
    
    func showImageB() -> Bool {
        return imageB != nil
    }
    
    
}
