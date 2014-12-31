//
//  Dog.swift
//  Dog Walk
//
//  Created by wuyaming on 14/12/31.
//  Copyright (c) 2014年 Razeware. All rights reserved.
//

import Foundation
import CoreData

class Dog: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var walks: NSOrderedSet

}
