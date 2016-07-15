//
//  UILable.swift
//  ExtensionKitDemo
//
//  Created by wen on 16/7/2.
//  Copyright © 2016年 wenfeng. All rights reserved.
//

import UIKit


extension UILabel {
    
    public func setHtmlText(html: String) {
        let encodedData = html.dataUsingEncoding(NSUnicodeStringEncoding)!
        let attributedOptions = [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType]
        do {
            let attributedString = try NSAttributedString(data: encodedData, options: attributedOptions, documentAttributes: nil)
            self.attributedText = attributedString
        } catch {
            print("UILabel setHtmlText(\(html)) has errors!")
        }
    }
    
    public func setLineSpacing(spacing: CGFloat) {
        if let text = self.text {
            let attributeString = NSMutableAttributedString(string: text)
            let style = NSMutableParagraphStyle()
            
            style.lineSpacing = spacing
            style.alignment = self.textAlignment
            attributeString.addAttributes([NSParagraphStyleAttributeName: style], range: NSRange(location: 0, length: text.characters.count))
            self.attributedText = attributeString
        }
    }
    
}