//
//  DetailViewController.swift
//  ShotsApp
//
//  Created by wuyaming on 14/12/6.
//  Copyright (c) 2014年 wuyaming. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var backButton: UIButton!
    
    var data = Array<Dictionary<String,String>>()
    var number = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        avatarImageView.image = UIImage(named: data[number]["avatar"]!)
        authorLabel.text = data[number]["author"]
        imageView.image = UIImage(named: data[number]["image"]!)
        textView.text = data[number]["text"]
        
        backButton.alpha = 0
    }
    
    @IBAction func backButtonDidPress(sender: AnyObject) {
        performSegueWithIdentifier("detailToHome", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailToHome" {
            let controller = segue.destinationViewController as HomeViewController
            controller.data = data
            controller.number = number
            if number >= 3 {
                controller.nextNumber = 0
            } else {
                controller.nextNumber = number + 1
            }
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        backButton.alpha = 1
        springScaleFrom(backButton!, -100, 0, 0.5, 0.5)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
