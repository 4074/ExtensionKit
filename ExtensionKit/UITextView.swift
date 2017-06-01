//
//  UITextView.swift
//  ExtensionKitDemo
//
//  Created by wen on 2017/5/31.
//  Copyright © 2017年 wenfeng. All rights reserved.
//

import UIKit

extension UITextView {
    
    @discardableResult
    public func addPlaceholder (_ text: String = "type in..") -> UILabel {
        let label = UILabel()
        label.font = self.font
        label.textColor = .lightGray
        label.text = text
        label.sizeToFit()
        self.addSubview(label)
        self.setValue(label, forKey: "_placeholderLabel")
        
        return label
    }
}
