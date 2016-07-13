//
//  UITableViewCell.swift
//  ExtensionKitDemo
//
//  Created by wen on 16/7/2.
//  Copyright © 2016年 wenfeng. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    public func setSeparatorInsetZero() {
        self.preservesSuperviewLayoutMargins = false
        self.separatorInset = UIEdgeInsetsZero
        self.layoutMargins = UIEdgeInsetsZero
    }
    
}
