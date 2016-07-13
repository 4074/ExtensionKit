//
//  Color.swift
//  ExtensionKitDemo
//
//  Created by wen on 16/7/2.
//  Copyright © 2016年 wenfeng. All rights reserved.
//

import UIKit

extension UIColor {
    public class func fromHexString(hexString: String, alpha: CGFloat = 1) -> UIColor {
        let hexString = hexString.trim()
        let scanner = NSScanner(string: hexString)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt(&color)
        
        let red = CGFloat((color & 0xFF0000) >> 16) / 255
        let green = CGFloat((color & 0x00FF00) >> 8) / 255
        let blue = CGFloat((color & 0x0000FF)) / 255
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    public func toHexString() -> String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let color: Int = Int(red * 255) << 16 | Int(green * 255) << 8 | Int(blue * 255) << 0
        
        return String(format:"#%06x", color)
    }
}