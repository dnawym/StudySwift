//
//  ViewController.swift
//  loginApp
//
//  Created by chuwei on 10/4/14.
//  Copyright (c) 2014 yaming. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func didLoginClick(sender: UIButton) {
        let userName = userTextField.text
        let password = passwordTextField.text
        if userName == "admin" && password == "123"
        {
            println("admin login success")
            resultLabel.text = "admin login success"
        }
        else
        {
            println("username or password error")
            resultLabel.text = "username or password error"
        }
    }
}

