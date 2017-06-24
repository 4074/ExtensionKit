//
//  UIImage.swift
//  ExtensionKitDemo
//
//  Created by wen on 2017/6/1.
//  Copyright © 2017年 wenfeng. All rights reserved.
//

import UIKit

extension UIImage {
    public func resize(to: CGSize) -> UIImage {
        let origin = self.size
        
        let widthRatio = to.width / origin.width
        let heightRatio = to.height / origin.height
        let ratio = min(widthRatio, heightRatio)
        let size = CGSize(width: origin.width * ratio, height: origin.height * ratio)
        
        let rect = CGRect(x: (to.width - size.width) / 2, y: (to.height - size.height) / 2, width: size.width, height: size.height)
        
        UIGraphicsBeginImageContextWithOptions(to, false, 1)
        self.draw(in: rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
}
