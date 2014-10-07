//
//  ViewController.swift
//  David_01
//
//  Created by chuwei on 10/2/14.
//  Copyright (c) 2014 yaming. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.text = "hello hello yaming!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func didSignClicked(sender: AnyObject) {
    }
    @IBAction func didViewClicked(sender: AnyObject) {
    }
}

