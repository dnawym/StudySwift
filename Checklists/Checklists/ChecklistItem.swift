//
//  ChecklistItem.swift
//  Checklists
//
//  Created by chuwei on 10/19/14.
//  Copyright (c) 2014 yaming. All rights reserved.
//

import Foundation

class ChecklistItem : NSObject{
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}