//
//  CALayer.swift
//  ExtensionKitDemo
//
//  Created by wen on 2016/12/23.
//  Copyright © 2016年 wenfeng. All rights reserved.
//

import UIKit

extension CALayer {
    
    @discardableResult
    public func addBorder(_ color: UIColor, thickness: CGFloat = 1, edge: UIRectEdge = .all) -> [UIRectEdge.RawValue: CALayer] {
        let border = CALayer()
        var result: [UIRectEdge.RawValue: CALayer] = [:]
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)
            result[edge.rawValue] = border
            break
        case UIRectEdge.bottom:
            border.frame = CGRect(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
            result[edge.rawValue] = border
            break
        case UIRectEdge.left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: frame.height)
            result[edge.rawValue] = border
            break
        case UIRectEdge.right:
            border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
            result[edge.rawValue] = border
            break
        case UIRectEdge.all:
            for direction in [UIRectEdge.top, UIRectEdge.right, UIRectEdge.bottom, UIRectEdge.left] {
                result[direction.rawValue] = self.addBorder(color, thickness: thickness, edge: direction)[direction.rawValue]
            }
            return result
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        self.addSublayer(border)
        
        return result
    }
    
    @discardableResult
    public func addDashBorder(_ color: UIColor, thickness: CGFloat = 1, dashPattern: [NSNumber] = [4, 2]) -> CAShapeLayer {
        let border = CAShapeLayer()
        border.strokeColor = color.cgColor
        border.lineWidth = thickness
        border.fillColor = nil
        border.lineDashPattern = dashPattern
        
        self.addSublayer(border)
        border.path = UIBezierPath(rect: self.bounds).cgPath
        border.frame = self.bounds
        
        return border
    }
    
    private func addShadowWithRoundedCorners() {
        if let contents = self.contents {
            masksToBounds = false
            sublayers?.filter{ $0.frame.equalTo(self.bounds) }
                .forEach{ $0.roundCornersWithShadow(radius: self.cornerRadius) }
            self.contents = nil
            if let sublayer = sublayers?.first,
                sublayer.name == "EXTENSION_KIT_addShadowWithRoundedCorners" {
                
                sublayer.removeFromSuperlayer()
            }
            let contentLayer = CALayer()
            contentLayer.name = "EXTENSION_KIT_addShadowWithRoundedCorners"
            contentLayer.contents = contents
            contentLayer.frame = bounds
            contentLayer.cornerRadius = cornerRadius
            contentLayer.masksToBounds = true
            insertSublayer(contentLayer, at: 0)
        }
    }
    
    public func roundCornersWithShadow(radius: CGFloat) {
        self.cornerRadius = radius
        if shadowOpacity != 0 {
            addShadowWithRoundedCorners()
        }
    }
}
