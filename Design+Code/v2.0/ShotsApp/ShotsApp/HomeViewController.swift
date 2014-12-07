//
//  HomeViewController.swift
//  ShotsApp
//
//  Created by wuyaming on 14/12/5.
//  Copyright (c) 2014年 wuyaming. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var userButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var backgroundMaskView: UIView!
    @IBOutlet weak var dialogView: UIView!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var shareView: UIView!
    
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var favoritesLabel: UILabel!
    @IBOutlet weak var maskButton: UIButton!
    
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    
    @IBOutlet weak var shareLabelsView: UIView!
    
    var animator: UIDynamicAnimator!
    var attachmentBehavior: UIAttachmentBehavior!
    var gravityBehavior: UIGravityBehavior!
    var snapBehavior: UISnapBehavior!
    
    @IBOutlet var panRecognizer: UIPanGestureRecognizer!
    
    @IBAction func handleGesture(sender: AnyObject) {
        //println(sender)
        let myView = dialogView
        let location = sender.locationInView(view)
        let boxLocation = sender.locationInView(dialogView)
        
        if sender.state == UIGestureRecognizerState.Began{
            animator.removeBehavior(snapBehavior)
            
            let centerOffset = UIOffsetMake(boxLocation.x - CGRectGetMidX(myView.bounds), boxLocation.y - CGRectGetMidY(myView.bounds))
            
            attachmentBehavior = UIAttachmentBehavior(item: myView, offsetFromCenter: centerOffset, attachedToAnchor: location)
            attachmentBehavior.frequency = 0
            
            animator.addBehavior(attachmentBehavior)
        } else if sender.state == UIGestureRecognizerState.Changed {
            attachmentBehavior.anchorPoint = location
        } else if sender.state == UIGestureRecognizerState.Ended {
            animator.removeBehavior(attachmentBehavior)
            
            snapBehavior = UISnapBehavior(item: myView, snapToPoint: view.center)
            animator.addBehavior(snapBehavior)
            
            let translation = sender.translationInView(view)
            if translation.y > 100 {
                animator.removeAllBehaviors()
                
                var gravity = UIGravityBehavior(items: [dialogView])
                gravity.gravityDirection = CGVectorMake(0, 10)
                animator.addBehavior(gravity)
                
                delay(0.3) {
                    self.refreshView()
                }

            }
        }
    }
    
    func refreshView() {
        number = nextNumber
        nextNumber++
        dialogView.center = view.center
        
        animator.removeAllBehaviors()
        
        snapBehavior = UISnapBehavior(item: dialogView, snapToPoint: view.center)
        animator.addBehavior(snapBehavior)
        
        viewDidAppear(true)
        
        if nextNumber > 3 {
            nextNumber = 0
        }
    }

    @IBAction func maskButtonDidPress(sender: AnyObject) {
        //maskButton.hidden = true
        spring(0.5) {
            self.maskButton.alpha = 0
        }
        
        hideShareView()
        hidePopupView()
    }
    
    func showMaskButton() {
        self.maskButton.hidden = false
        self.maskButton.alpha = 0
        spring(0.5) {
            self.maskButton.alpha = 1
        }
    }
    
    @IBAction func likeButtonDidPress(sender: AnyObject) {
        
    }
    
    @IBAction func shareButtonDidPress(sender: AnyObject) {
        shareView.hidden = false
        shareView.transform = CGAffineTransformMakeTranslation(0, 200)
        showMaskButton()
        
        emailButton.transform = CGAffineTransformMakeTranslation(0, 200)
        twitterButton.transform = CGAffineTransformMakeTranslation(0, 200)
        facebookButton.transform = CGAffineTransformMakeTranslation(0, 200)
        
        shareLabelsView.alpha = 0
        
        spring(0.5) {
            self.shareView.transform = CGAffineTransformMakeTranslation(0, 0)
            self.dialogView.transform = CGAffineTransformMakeScale(0.8, 0.8)
        }
        
        springWithDelay(0.5, 0.05, {
            self.emailButton.transform = CGAffineTransformMakeTranslation(0, 0)
        })
        
        springWithDelay(0.5, 0.10, {
            self.twitterButton.transform = CGAffineTransformMakeTranslation(0, 0)
        })
        
        springWithDelay(0.5, 0.15, {
            self.facebookButton.transform = CGAffineTransformMakeTranslation(0, 0)
        })
        
        springWithDelay(0.5, 0.2, {
            self.shareLabelsView.alpha = 1
        })
    }
    
    func hideShareView() {
        spring(0.5) {
            self.shareView.transform = CGAffineTransformMakeTranslation(0, 0)
            self.dialogView.transform = CGAffineTransformMakeScale(1, 1)
            self.shareView.hidden = true
        }
    }
    
    @IBAction func userButtonDidPress(sender: AnyObject) {
        popupView.hidden = false
        popupView.alpha = 0
        
        showMaskButton()
        
        let scale = CGAffineTransformMakeScale(0.3, 0.3)
        let translate = CGAffineTransformMakeTranslation(50, -50)
        popupView.transform = CGAffineTransformConcat(scale, translate)
        
        spring(0.5) {
            self.popupView.alpha = 1
            let scale = CGAffineTransformMakeScale(1, 1)
            let translate = CGAffineTransformMakeTranslation(0, 0)
            self.popupView.transform = CGAffineTransformConcat(scale, translate)
        }
    }
    
    func hidePopupView() {
        spring(0.5) {
            self.popupView.hidden = true
        }
    }

    @IBAction func imageButtonDidPress(sender: AnyObject) {
        
        springWithCompletion(0.5, {
            self.dialogView.frame = CGRectMake(0, 0, 414, 736)
            self.dialogView.layer.cornerRadius = 0
            self.imageButton.frame = CGRectMake(0, -1, 414, 311)
            self.likeButton.alpha = 0
            self.shareButton.alpha = 0
            self.userButton.alpha = 0
            self.headerView.alpha = 0
            }, { finishd in
                self.performSegueWithIdentifier("showDetail", sender: self)
        })
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    var data = getData()
    var number = 0
    var nextNumber = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        insertBlurView(backgroundMaskView, UIBlurEffectStyle.Dark)
        insertBlurView(headerView, UIBlurEffectStyle.Dark)
        
        animator = UIDynamicAnimator(referenceView: view)
        
        dialogView.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(Bool())
        
        let scale = CGAffineTransformMakeScale(0.5, 0.5)
        let translate = CGAffineTransformMakeTranslation(0, -200)
        dialogView.transform = CGAffineTransformConcat(scale, translate)
        
        spring(0.5) {
            let scale = CGAffineTransformMakeScale(1, 1)
            let translate = CGAffineTransformMakeTranslation(0, 0)
            self.dialogView.transform = CGAffineTransformConcat(scale, translate)
        }
        
        avatarImageView.image = UIImage(named: data[number]["avatar"]!)
        imageButton.setImage(UIImage(named: data[number]["image"]!), forState: UIControlState.Normal)
        backgroundImageView.image = UIImage(named: data[number]["image"]!)
        authorLabel.text = data[number]["author"]
        titleLabel.text = data[number]["title"]
        
        dialogView.alpha = 1
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            let controller = segue.destinationViewController as DetailViewController
            
            controller.data = data
            controller.number = number
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

