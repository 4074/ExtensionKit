//
//  UIViewController.swift
//  ExtensionKitDemo
//
//  Created by wen on 2017/7/10.
//  Copyright © 2017年 wenfeng. All rights reserved.
//

import UIKit

extension UIViewController {
    
    public func alert(
        _ message: String,
        title: String = "",
        text: (confirm: String?, cancel: String?) = (confirm: "OK", cancel: nil),
        handler: (confirm: ((UIAlertAction) -> Void)?, cancel: ((UIAlertAction) -> Void)?) = (confirm: nil, cancel: nil)
    ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: text.confirm, style: .default, handler: handler.confirm)
        alertController.addAction(confirmAction)
        
        if let cancelText = text.cancel {
            let cancelAction = UIAlertAction(title: cancelText, style: .cancel, handler: handler.cancel)
            alertController.addAction(cancelAction)
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
}
