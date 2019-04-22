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
                button.setTitleColor(color, for: UIControl.State())
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
    
    public func createSpinView(_ backgroundColor: UIColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6), spinColor: UIColor? = nil, size: CGSize = CGSize(width: 60, height: 60)) -> (component: UIView, spin: UIActivityIndicatorView) {
        
        let backgroundView = UIView(frame: self.frame)
        backgroundView.backgroundColor = backgroundColor
        backgroundView.isHidden = true
        
        let x = (self.frame.width - size.width) / 2
        let y = (self.frame.height - size.height) / 2
        let aiView = UIActivityIndicatorView(frame: CGRect(x: x, y: y, width: size.width, height: size.height))
        backgroundView.addSubview(aiView)
        aiView.color = spinColor ?? self.tintColor
        
        return (component: backgroundView, spin: aiView)
    }
    
    public func toggleSpinView(_ views: (component: UIView, spin: UIActivityIndicatorView), visible: Bool = true) {
        
        if views.component.isHidden == !visible {
            return
        }
        
        if visible {
            views.component.layer.opacity = 0
            views.component.isHidden = !visible
            views.spin.startAnimating()
            
            UIView.animate(withDuration: 0.2, animations: {
                views.component.layer.opacity = 1
            }, completion: { _ -> Void in
            })
        } else {
            UIView.animate(withDuration: 0.4, animations: {
                views.component.layer.opacity = 0
            }, completion: { _ -> Void in
                views.component.isHidden = !visible
                views.component.layer.opacity = 1
                
                views.spin.stopAnimating()
            })
        }
    }
}








