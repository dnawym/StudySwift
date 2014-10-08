//
//  ViewController.swift
//  UIView
//
//  Created by chuwei on 10/8/14.
//  Copyright (c) 2014 yaming. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        redView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        redView.frame = CGRectMake(0, 0, 150, 150)
        
        var f = CGRectMake(100, 100, 150, 150)
        var greenView = UIView(frame: f)
        greenView.backgroundColor = UIColor.greenColor()
        self.view.addSubview(greenView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

