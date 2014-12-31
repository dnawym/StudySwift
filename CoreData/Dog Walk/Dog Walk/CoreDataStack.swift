//
//  CoreDataStack.swift
//  Dog Walk
//
//  Created by wuyaming on 14/12/31.
//  Copyright (c) 2014年 Razeware. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    let context: NSManagedObjectContext
    let psc: NSPersistentStoreCoordinator
    let model: NSManagedObjectModel
    let store: NSPersistentStore?
    
    init() {
        // 从硬盘加载managed object model，这里通过读取momd目录下的编译后的.xcdatamodeld文件实现
        let bundle = NSBundle.mainBundle()
        let modelURL = bundle.URLForResource("Dog Walk", withExtension: "momd")
        model = NSManagedObjectModel(contentsOfURL: modelURL!)!
        
        // 一旦初始化了NSManagedObjectModel，下一步是创建PSC，PSC用于桥接model和PersistentStore
        psc = NSPersistentStoreCoordinator(managedObjectModel: model)
        
        // Context的初始化没有任何参数，我们将psc连接到context上
        context = NSManagedObjectContext()
        context.persistentStoreCoordinator = psc
        
        // 我们不需要手工创建PS，PSC会帮我们创建它。我们只需要为PSC提供所需的PS类型，一些配置，存放路径即可
        let documentsURL = applicationDocumentsDirectory()
        let storeURL = documentsURL.URLByAppendingPathComponent("Dog Walk")
        
        let options = [NSMigratePersistentStoresAutomaticallyOption: true]
        
        var error: NSError? = nil
        store = psc.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: options, error: &error)
        
        if store == nil {
            println("Error adding persistent store: \(error)")
            abort()
        }
    }
    
    func saveContext() {
        var error: NSError? = nil
        if context.hasChanges && !context.save(&error) {
            println("Could not save: \(error), \(error?.userInfo)")
        }
    }
    
    // 获取应用程序documents diretory的url
    func applicationDocumentsDirectory() -> NSURL {
        let fileManager = NSFileManager.defaultManager()
        
        let urls = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask) as [NSURL]
        
        return urls[0]
    }
}