//
//  Reservation.swift
//  CampgroundManager
//
//  Created by Aaron Douglas on 8/17/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import Foundation
import CoreData

public class Reservation: NSManagedObject {

    @NSManaged public var dateFrom: NSDate
    @NSManaged public var dateTo: NSDate
    @NSManaged public var status: String
    @NSManaged public var camper: NSManagedObject
    @NSManaged public var campSite: NSManagedObject

}
