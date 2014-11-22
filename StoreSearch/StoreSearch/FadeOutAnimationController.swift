//
//  FadeOutAnimationController.swift
//  StoreSearch
//
//  Created by wuyaming on 14-11-22.
//  Copyright (c) 2014年 yaming. All rights reserved.
//

import UIKit

class FadeOutAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        if let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey) {
            let duration = transitionDuration(transitionContext)
            
            UIView.animateWithDuration(duration, animations: {
                fromView.alpha = 0
                }, completion: {
                finished in
                    transitionContext.completeTransition(true)
            })
        }
    }
}
