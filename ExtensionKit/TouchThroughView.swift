//
//  TouchThroughView.swift
//  ExtensionKitDemo
//
//  Created by wen on 2017/7/10.
//  Copyright © 2017年 wenfeng. All rights reserved.
//

import UIKit

public class TouchThroughTableView: UITableView {
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.next?.touchesBegan(touches, with: event)
        super.touchesBegan(touches, with: event)
    }
}

public class TouchThroughCollectionView: UICollectionView {
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.next?.touchesBegan(touches, with: event)
        super.touchesBegan(touches, with: event)
    }
}
