//
//  ViewController.swift
//  Note
//
//  Created by chuwei on 10/4/14.
//  Copyright (c) 2014 yaming. All rights reserved.
//

import UIKit

func yourFunction(var a: Int, var b: Int) -> Int
{
    println("hello function \(a) \(b)")
    a += 1
    b += 1
    return a + b
}

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    //var array = [String]()
    var array = [Dictionary<String, String>]()
    
    func myFunction(label a: Int, label1 b: Int) -> Int
    {
        println("hello function \(a) \(b)")
        return a + b
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var printTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //myFunction(label:100, b:200)
        var result = myFunction(label:100, label1:200)
        println("result: \(result)")
        
        var a = 0, b = 0
        a = 100
        b = 200
        yourFunction(a, b)
        println("a = \(a), b = \(b)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func saveClicked(sender: AnyObject) {
        var content = textView.text
        //array.append(content)
        
        var name = nameTextField.text
        
        println("Name is: " + name)
        
        var dict: Dictionary<String, String> = ["name":name, "content":content]
//        var dict = Dictionary<String, String>()
//        dict["name"] = name
//        dict["content"] = content
        println(dict)
        array.append(dict)
    }
    @IBAction func viewClicked(sender: AnyObject) {
        
        self.view.endEditing(true)
        var printString = ""
        for var i = 0; i < array.count; ++i
        {
            //println(array[i]["name"])
            var dict = array[i]
            var name = array[i]["name"]
            printString += dict["content"]! + "\n"
        }
        
        printTextView.text = printString
    }


    @IBAction func openClicked(sender: AnyObject) {
        self.view.endEditing(true)
        var name = nameTextField.text
        for dict in array
        {
            if name == dict["name"]!
            {
                textView.text = dict["content"]!
            }
        }
    }
    
    @IBAction func didTapped(sender: AnyObject) {
        self.view.endEditing(true)
    }
}

