//
//  String.swift
//  ExtensionKitDemo
//
//  Created by wen on 16/7/2.
//  Copyright © 2016年 wenfeng. All rights reserved.
//

import Foundation

extension String {
    
    public func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    public func split(_ separator: Character) -> [String] {
        return self.split(separator: separator).map(String.init)
    }
}
