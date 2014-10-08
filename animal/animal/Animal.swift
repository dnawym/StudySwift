//
//  Animal.swift
//  animal
//
//  Created by chuwei on 10/7/14.
//  Copyright (c) 2014 yaming. All rights reserved.
//

import Foundation

class Animal: NSObject
{
    var weight: Double = 0
    var age: Int = 0
    
    func eat(something:Double, something2:Double) -> Double
    {
        weight += something - something2
        println("weight: \(weight)")
        return weight
    }
}