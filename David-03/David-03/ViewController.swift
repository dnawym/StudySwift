//
//  ViewController.swift
//  David-03
//
//  Created by chuwei on 10/2/14.
//  Copyright (c) 2014 yaming. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UITextField!
    
    var operand1: String = ""
    var operand2: String = ""
    var op: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func didClick(sender: UIButton) {
        //println("\(sender.currentTitle)")
        let value = sender.currentTitle
        
        if value == "+" || value == "-" || value == "*" || value == "/"
        {
            println("\(value)")
            op = value!
            resultLabel.text = op
            return
        }
        else if value == "="
        {
            var result = 0
            switch op{
                case "+":
                    result = operand1.toInt()! + operand2.toInt()!
                case "-":
                    result = operand1.toInt()! - operand2.toInt()!
                case "*":
                    result = operand1.toInt()! * operand2.toInt()!
                case "/":
                    result = operand1.toInt()! / operand2.toInt()!
            default:
                result = 0
            }
            resultLabel.text = "\(result)"
            operand1 = ""
            operand2 = ""
            op = ""
            return
        }
        
        if op == ""
        {
            operand1 += value!
            resultLabel.text = operand1
        }
        else
        {
            operand2 += value!
            resultLabel.text = operand2
        }
    }
}

