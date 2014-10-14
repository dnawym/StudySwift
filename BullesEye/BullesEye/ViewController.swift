//
//  ViewController.swift
//  BullesEye
//
//  Created by chuwei on 10/12/14.
//  Copyright (c) 2014 yaming. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var round = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //startNewRound()
        startNewGame()
        updateLabels()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, forState: .Normal)

        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageNormal, forState: .Highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage?.resizableImageWithCapInsets(insets)
        slider.setMinimumTrackImage(trackLeftResizable, forState: .Normal)
  
        let trackRightImage = UIImage(named: "SliderTrackRight")
        let trackRightResizable = trackRightImage?.resizableImageWithCapInsets(insets)
        slider.setMaximumTrackImage(trackRightResizable, forState: .Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        /*var difference: Int
        if currentValue > targetValue
        {
            difference = currentValue - targetValue
        }
        else
        {
            difference = targetValue - currentValue
        }*/
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        score += points
        
        var title: String
        if difference == 0
        {
            title = "Perfect!"
            points += 100
        }
        else if difference < 5
        {
            title = "You almost had it!"
            points += 50
        }
        else if difference < 10
        {
            title = "Pretty good!"
        }
        else
        {
            title = "Not even close..."
        }
        
        //let message = "The value of the slider is: \(currentValue)"
        //            + "\nThe target value is: \(targetValue)"
        //            + "\nThe difference is: \(difference)"
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: title,
            message: message,
            preferredStyle: .Alert)

        //let alert = UIAlertController(title: "hi", message: "hello", preferredStyle: .Alert)
        
        //let alert = UIAlertView()
        //alert.title = "Title"
        //alert.message = "My message"
        //alert.addButtonWithTitle("Ok")
        //alert.show()
        
        
        let action = UIAlertAction(title: "OK", style: .Default, handler: {
            action in
            self.startNewRound()
            self.updateLabels()
        })
    
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)

        //startNewRound()
        //updateLabels()
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        println("The value of the slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound() {
        round += 1
        // arc4random_uniform(100) generates 0 - 99, adding 1 is needed here to get 1 - 100
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
    @IBAction func startOver() {
        startNewGame()
        updateLabels()
    }
}













