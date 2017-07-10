//
//  TouchThroughView.swift
//  ExtensionKitDemo
//
//  Created by wen on 2017/7/10.
//  Copyright © 2017年 wenfeng. All rights reserved.
//

import UIKit

class TouchThroughTableView: UITableView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.next?.touchesBegan(touches, with: event)
        super.touchesBegan(touches, with: event)
    }
}

class TouchThroughCollectionView: UICollectionView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.next?.touchesBegan(touches, with: event)
        super.touchesBegan(touches, with: event)
    }
}
