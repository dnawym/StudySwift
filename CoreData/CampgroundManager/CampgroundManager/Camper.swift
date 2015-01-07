//
//  Camper.swift
//  CampgroundManager
//
//  Created by Aaron Douglas on 8/17/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import Foundation
import CoreData

public class Camper: NSManagedObject {

    @NSManaged public var fullName: String
    @NSManaged public var phoneNumber: String
    @NSManaged var reservations: Reservation

}
