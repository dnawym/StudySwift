//
//  CamperService.swift
//  CampgroundManager
//
//  Created by Aaron Douglas on 8/24/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import Foundation
import CoreData

public class CamperService {
    let managedObjectContext: NSManagedObjectContext
    let coreDataStack: CoreDataStack
    
    public init(managedObjectContext: NSManagedObjectContext, coreDataStack: CoreDataStack) {
        self.managedObjectContext = managedObjectContext
        self.coreDataStack = coreDataStack
    }
    
    public func addCamper(name: String, phoneNumber: String) -> Camper? {
        var camper = NSEntityDescription.insertNewObjectForEntityForName("Camper", inManagedObjectContext: self.managedObjectContext) as Camper
        camper.fullName = name
        camper.phoneNumber = phoneNumber

        self.coreDataStack.saveContext(self.managedObjectContext)

        return camper
    }
}