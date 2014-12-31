//
//  Walk.swift
//  Dog Walk
//
//  Created by wuyaming on 14/12/31.
//  Copyright (c) 2014年 Razeware. All rights reserved.
//

import Foundation
import CoreData

class Walk: NSManagedObject {

    @NSManaged var date: NSDate
    @NSManaged var dog: Dog

}
