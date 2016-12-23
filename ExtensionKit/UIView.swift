//
//  UIView.swift
//  ExtensionKitDemo
//
//  Created by wen on 16/5/24.
//  Copyright © 2016年 wenfeng. All rights reserved.
//

import UIKit

extension UIView {
    
    public func setCornerRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    public func setFont(_ font: UIFont, tag: Int? = nil) {
        if let label = self as? UILabel {
            if tag == nil || label.tag == tag {
                label.font = font
            }
            return
        }
        
        if let button = self as? UIButton {
            if tag == nil || button.tag == tag {
                button.titleLabel?.font = font
            }
            return
        }
        
        if let field = self as? UITextField {
            if tag == nil || field.tag == tag {
                field.font = font
            }
            return
        }
        
        if let view = self as? UITextView {
            if tag == nil || view.tag == tag {
                view.font = font
            }
            return
        }
        
        for view in self.subviews {
            view.setFont(font, tag: tag)
        }
    }
    
    public func setFont(_ name: String, size: CGFloat, tag: Int? = nil) {
        if let font = UIFont(name: name, size: size) {
            self.setFont(font, tag: tag)
        } else {
            self.setFont(size, tag: tag)
        }
        
    }
    
    public func setFont(_ size: CGFloat, tag: Int? = nil) {
        self.setFont(UIFont.systemFont(ofSize: size), tag: tag)
    }
    
    public func setTextColor(_ color: UIColor, tag: Int? = nil) {
        if let label = self as? UILabel {
            if tag == nil || label.tag == tag {
                label.textColor = color
            }
            return
        }
        
        if let button = self as? UIButton {
            if tag == nil || button.tag == tag {
                button.setTitleColor(color, for: UIControlState())
            }
            return
        }
        
        if let textField = self as? UITextField {
            if tag == nil || textField.tag == tag {
                textField.textColor = color
            }
            return
        }
        
        if let view = self as? UITextView {
            if tag == nil || view.tag == tag {
                view.textColor = color
            }
            return
        }
        
        for view in self.subviews {
            view.setTextColor(color, tag: tag)
        }
    }
}








