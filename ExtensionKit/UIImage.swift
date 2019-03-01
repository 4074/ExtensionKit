//
//  UIImage.swift
//  ExtensionKitDemo
//
//  Created by wen on 2017/6/1.
//  Copyright © 2017年 wenfeng. All rights reserved.
//

import UIKit

extension UIImage {
    public func resize(to: CGSize, type: UIView.ContentMode = .scaleAspectFit) -> UIImage {
        let origin = self.size
        let widthRatio = to.width / origin.width
        let heightRatio = to.height / origin.height
        let ratio = type == .scaleAspectFit ? min(widthRatio, heightRatio) : max(widthRatio, heightRatio)
        let size = CGSize(width: origin.width * ratio, height: origin.height * ratio)
        
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        self.draw(in: rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
}
