//
//  Color.swift
//  ExtensionKitDemo
//
//  Created by wen on 16/7/2.
//  Copyright © 2016年 wenfeng. All rights reserved.
//

import UIKit

extension UIColor {
    public class func fromHexString(_ hexString: String, alpha: CGFloat = 1) -> UIColor {
        let hexString = hexString.trim()
        let scanner = Scanner(string: hexString)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
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
    
    public func to(target: UIColor, ratio: CGFloat) -> UIColor {
        let ratio = min(max(ratio, 0), 1)
        var s_red: CGFloat = 0, s_green: CGFloat = 0, s_blue: CGFloat = 0, s_alpha: CGFloat = 0
        self.getRed(&s_red, green: &s_green, blue: &s_blue, alpha: &s_alpha)
        
        var t_red: CGFloat = 0, t_green: CGFloat = 0, t_blue: CGFloat = 0, t_alpha: CGFloat = 0
        target.getRed(&t_red, green: &t_green, blue: &t_blue, alpha: &t_alpha)
        
        let red = (t_red - s_red) * ratio + s_red
        let green = (t_green - s_green) * ratio + s_green
        let blue = (t_blue - s_blue) * ratio + s_blue
        let alpha = (t_alpha - s_alpha) * ratio + s_alpha
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
