//
//  AppDelegate.swift
//  StoreSearch
//
//  Created by YaMing on 11/9/14.
//  Copyright (c) 2014 yaming. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        customizeAppearance()
        
        detailViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem()
        
        searchViewController.splitViewDetail = detailViewController
        
        splitViewController.delegate = self
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func customizeAppearance() {
        let barTintColor = UIColor(red: 20/255, green: 160/255, blue: 160/255, alpha: 1)
        UISearchBar.appearance().barTintColor = barTintColor
        window!.tintColor = UIColor(red: 10/255, green: 80/255, blue: 80/255, alpha: 1)
    }
    
    var splitViewController: UISplitViewController {
        return window!.rootViewController as UISplitViewController
    }
    
    var searchViewController: SearchViewController {
        return splitViewController.viewControllers.first as SearchViewController
    }
    
    var detailNavigationController: UINavigationController {
        return splitViewController.viewControllers.last as UINavigationController
    }
    
    var detailViewController: DetailViewController {
        return detailNavigationController.topViewController as DetailViewController
    }
}

extension AppDelegate: UISplitViewControllerDelegate {
    func splitViewController(svc: UISplitViewController, willChangeToDisplayMode displayMode: UISplitViewControllerDisplayMode) {
        println(__FUNCTION__)
        
        if displayMode == .PrimaryOverlay {
            svc.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}
