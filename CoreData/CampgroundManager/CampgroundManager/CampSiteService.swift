//
//  CampSiteService.swift
//  CampgroundManager
//
//  Created by Aaron Douglas on 8/18/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import Foundation
import CoreData

public class CampSiteService {
    let managedObjectContext: NSManagedObjectContext
    let coreDataStack: CoreDataStack
    
    public init(managedObjectContext: NSManagedObjectContext, coreDataStack: CoreDataStack) {
        self.managedObjectContext = managedObjectContext
        self.coreDataStack = coreDataStack
    }
    
    public func addCampSite(siteNumber: NSNumber, electricity: Bool, water: Bool) -> CampSite {
    var campSite: CampSite = NSEntityDescription.insertNewObjectForEntityForName("CampSite", inManagedObjectContext: self.managedObjectContext) as CampSite
        campSite.siteNumber = siteNumber
        campSite.electricity = NSNumber(bool: electricity)
        campSite.water = NSNumber(bool: water)
        
        self.coreDataStack.saveContext(self.managedObjectContext)
        
        return campSite
    }
    
    public func deleteCampSite(siteNumber: NSNumber) {
        // TODO : Not yet implemented
    }
    
    public func getCampSite(siteNumber: NSNumber) -> CampSite? {
        // TODO : Not yet implemented

        return nil
    }
    
    public func getCampSites() -> Array<CampSite> {
        // TODO : Not yet implemented
        
        return Array<CampSite>()
    }
    
    public func getNextCampSiteNumber() -> NSNumber {
        // TODO : Not yet implemented
        
        return -1
    }
}