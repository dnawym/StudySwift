//
//  ViewController.swift
//  testTransform
//
//  Created by wuyaming on 14/12/7.
//  Copyright (c) 2014年 wuyaming. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var outerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonDidPressed(sender: AnyObject) {
        UIView.animateWithDuration(0.7, animations: {
            
            self.outerView.frame = CGRectMake(0, 0, 414, 568)
            //self.outerView.layer.cornerRadius = 0
            self.innerView.frame = CGRectMake(0, 0, 414, 240)

            
            })
        
    }
}

