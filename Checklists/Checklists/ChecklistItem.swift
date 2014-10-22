//
//  ChecklistItem.swift
//  Checklists
//
//  Created by chuwei on 10/19/14.
//  Copyright (c) 2014 yaming. All rights reserved.
//

import Foundation

class ChecklistItem : NSObject, NSCoding{
    required init(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObjectForKey("Text") as String
        checked = aDecoder.decodeBoolForKey("Checked")
        super.init()
    }
    
    override init() {
        super.init()
    }
    
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(text, forKey: "Text")
        aCoder.encodeBool(checked, forKey: "Checked")
    }
}