//
//  TestCoreDataStack.swift
//  CampgroundManager
//
//  Created by wuyaming on 15/1/7.
//  Copyright (c) 2015年 Razeware. All rights reserved.
//

import Foundation
import CampgroundManager
import CoreData

class TestCoreDataStack: CoreDataStack {
    override func initPSC() {
        var psc: NSPersistentStoreCoordinator? = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        var error: NSError? = nil
        
        var ps = psc!.addPersistentStoreWithType(NSInMemoryStoreType, configuration: nil, URL: nil, options: nil, error: &error)
        
        if ps == nil {
            abort()
        }
        
        persistentStoreCoordinator = psc
    }
}