//
//  CamperServiceTests.swift
//  CampgroundManager
//
//  Created by wuyaming on 15/1/7.
//  Copyright (c) 2015年 Razeware. All rights reserved.
//

import UIKit
import XCTest

import CampgroundManager
import CoreData

class CamperServiceTests: XCTestCase {
    
    var camperService: CamperService!
    var coreDataStack: CoreDataStack!

    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        coreDataStack = TestCoreDataStack()
        camperService = CamperService(managedObjectContext: coreDataStack.mainContext!, coreDataStack: coreDataStack)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        camperService = nil
        coreDataStack = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testAddCamper() {
        let camper = camperService.addCamper("Bacon Lover", phoneNumber: "13888888888")
        
        XCTAssertNotNil(camper, "Camper should not be nil")
        XCTAssertTrue(camper?.fullName == "Bacon Lover")
        XCTAssertTrue(camper?.phoneNumber == "13888888888")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
