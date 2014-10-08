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
    
    init(weight: Double, age: Int)
    {
        super.init()
        self.weight = weight
        self.age = age
    }
    
    func eat(something:Double, something2:Double) -> Double
    {
        weight += something - something2
        println("After eat, weight: \(weight)")
        return weight
    }
}