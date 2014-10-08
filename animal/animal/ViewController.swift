//
//  ViewController.swift
//  animal
//
//  Created by chuwei on 10/7/14.
//  Copyright (c) 2014 yaming. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var ani1:Animal = Animal()
        ani1.weight = 11.1
        ani1.age = 1
        var weight = ani1.eat(100, something2:50)
        println("weight in ViewController: \(weight)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

