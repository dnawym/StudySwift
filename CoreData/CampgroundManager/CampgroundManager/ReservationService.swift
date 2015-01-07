//
//  ReservationService.swift
//  CampgroundManager
//
//  Created by Aaron Douglas on 8/24/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import Foundation
import CoreData

public class ReservationService {
    let managedObjectContext: NSManagedObjectContext
    let coreDataStack: CoreDataStack
    
    public init(managedObjectContext: NSManagedObjectContext, coreDataStack: CoreDataStack) {
        self.managedObjectContext = managedObjectContext
        self.coreDataStack = coreDataStack
    }
    
    public func reserveCampSite(campSite: CampSite, camper: Camper, date: NSDate, numberOfNights: Int) -> (reservation: Reservation?, error: NSError?)  {
        let reservation = NSEntityDescription.insertNewObjectForEntityForName("Reservation", inManagedObjectContext: managedObjectContext) as Reservation
        reservation.camper = camper
        reservation.campSite = campSite
        reservation.dateFrom = date
        
        let dateComponents = NSDateComponents()
        dateComponents.day = numberOfNights
        
        let calendar = NSCalendar.currentCalendar()
        let toDate = calendar.dateByAddingComponents(dateComponents, toDate: date, options: nil)
        reservation.dateTo = toDate!
        
        // Some complex logic here to determine if reservation is valid or if there are conflicts
        var registrationError: NSError?
        
        reservation.status = "Reserved"
        
        coreDataStack.saveContext(managedObjectContext)
        
        // Error here would be a custom error to explain a failed reservation possibly
        return (reservation, registrationError)
    }
}