//
//  UINavigationBar.swift
//  ExtensionKitDemo
//
//  Created by wen on 16/7/14.
//  Copyright © 2016年 wenfeng. All rights reserved.
//

import UIKit

extension UINavigationBar {
    public func removeBottomImage() {
        for parent in self.subviews {
            for child in parent.subviews {
                if child is UIImageView {
                    child.removeFromSuperview()
                }
            }
        }
    }
}
