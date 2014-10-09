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
    let swipeRec = UISwipeGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //redView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        redView.frame = CGRectMake(100, 100, 50, 50)
        
        var f = CGRectMake(0, 0, 20, 20)
        var greenView = UIView(frame: f)
        greenView.backgroundColor = UIColor.greenColor()
        redView.addSubview(greenView)
        
        swipeRec.direction = UISwipeGestureRecognizerDirection.Left
        swipeRec.addTarget(self, action: "swipedView")
        self.view.addGestureRecognizer(swipeRec)
        self.view.userInteractionEnabled = true
        
        
    }

    func swipedView(){
        let tapAlert = UIAlertController(title: "Swiped", message: "You just swiped the swipe view", preferredStyle: UIAlertControllerStyle.Alert)
        tapAlert.addAction(UIAlertAction(title: "OK", style: .Destructive, handler: nil))
        self.presentViewController(tapAlert, animated: true, completion: nil)
        moveLeft()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func moveLeft()
    {
        var currentFrame = redView.frame
        var x = currentFrame.origin.x
        if currentFrame.origin.x - 10 >= 0
        {
            x -= 10
        }
        var newFrame = CGRect(x: x, y: currentFrame.origin.y,
            width: currentFrame.size.width, height: currentFrame.size.height)
        redView.frame = newFrame

    }


    @IBAction func didMoveLeftClicked(sender: AnyObject) {
        moveLeft()
    }
}

