//
//  ViewController.swift
//  SignIn
//
//  Created by chuwei on 10/4/14.
//  Copyright (c) 2014 yaming. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    var nameArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didSignClicked(sender: AnyObject) {
        var name = nameTextField.text
        nameArray.append(name)
    }
    @IBAction func didViewClicked(sender: AnyObject) {
        for item in nameArray
        {
            println("\(item)")
        }
    }

}

