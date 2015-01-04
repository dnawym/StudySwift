//
//  Team.swift
//  WorldCup
//
//  Created by Pietro Rea on 8/2/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import UIKit
import CoreData

class Team: NSManagedObject {
  
  @NSManaged var teamName: String
  @NSManaged var qualifyingZone: String
  @NSManaged var imageName: String
  @NSManaged var wins: NSNumber
  
}
