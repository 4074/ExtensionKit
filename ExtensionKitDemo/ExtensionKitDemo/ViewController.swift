//
//  ViewController.swift
//  ExtensionKitDemo
//
//  Created by wen on 16/5/24.
//  Copyright © 2016年 wenfeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initTextView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func initTextView() {
        let textView = UITextView(frame: CGRect(x: 16, y: 32, width: 200, height: 80))
        view.addSubview(textView)
        textView.setFont(13)
        
        textView.layer.addDashBorder(UIColor.lightGray)
        
        textView.addPlaceholder("请输入..")
    }
}

