//
//  CALayer.swift
//  ExtensionKitDemo
//
//  Created by wen on 2016/12/23.
//  Copyright © 2016年 wenfeng. All rights reserved.
//

import UIKit

extension CALayer {
    
    public func addBorder(_ color: UIColor, edge: UIRectEdge = .all, thickness: CGFloat = 1) {
        
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)
            break
        case UIRectEdge.bottom:
            border.frame = CGRect(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
            break
        case UIRectEdge.all:
            self.addBorder(color, edge: .top, thickness: thickness)
            self.addBorder(color, edge: .right, thickness: thickness)
            self.addBorder(color, edge: .bottom, thickness: thickness)
            self.addBorder(color, edge: .left, thickness: thickness)
            break
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        self.addSublayer(border)
    }
}
