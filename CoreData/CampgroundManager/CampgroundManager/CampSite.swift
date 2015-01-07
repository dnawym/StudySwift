//
//  CampSite.swift
//  CampgroundManager
//
//  Created by Aaron Douglas on 8/17/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import Foundation
import CoreData

public class CampSite: NSManagedObject {

    @NSManaged public var siteNumber: NSNumber
    @NSManaged public var electricity: NSNumber
    @NSManaged public var water: NSNumber
    @NSManaged public var reservations: Reservation

}
