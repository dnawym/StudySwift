//
//  MyTabBarController.swift
//  MyLocations
//
//  Created by yaming on 11/7/14.
//  Copyright (c) 2014 yaming. All rights reserved.
//

import UIKit
class MyTabBarController: UITabBarController {
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func childViewControllerForStatusBarStyle() -> UIViewController? {
        return nil
    }
}

