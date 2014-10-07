//
//  ViewController.swift
//  ScoreApp
//
//  Created by chuwei on 10/4/14.
//  Copyright (c) 2014 yaming. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didCheckClicked(sender: UIButton) {
        var score = scoreTextField.text.toInt()
        switch score!
        {
        case 0...59:
            imageView.image = UIImage(named: "Support")
        case 60...80:
            imageView.image = UIImage(named: "Colored")
            break
        case 81...100:
            imageView.image = UIImage(named: "Star")
            break
        default:
            break
        }
    }

}

