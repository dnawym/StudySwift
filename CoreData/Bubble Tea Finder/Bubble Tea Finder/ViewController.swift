//
//  ViewController.swift
//  Bubble Tea Finder
//
//  Created by Pietro Rea on 8/24/14.
//  Copyright (c) 2014 Pietro Rea. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, FilterViewControllerDelegate {
  
    @IBOutlet weak var tableView: UITableView!
    var coreDataStack: CoreDataStack!
    
    var fetchRequest: NSFetchRequest!
    var asyncFetchRequest: NSAsynchronousFetchRequest!
    var venues: [Venue]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let batchUpdate = NSBatchUpdateRequest(entityName: "Venue")
        batchUpdate.propertiesToUpdate = ["favorite" : NSNumber(bool: true)]
        batchUpdate.affectedStores = coreDataStack.psc.persistentStores
        batchUpdate.resultType = .UpdatedObjectsCountResultType
        
        var batchError: NSError?
        let batchResult = coreDataStack.context.executeRequest(batchUpdate, error: &batchError) as NSBatchUpdateResult?
        
        if let result = batchResult {
            println("Recored updated \(result.result)")
        } else {
            println("Could not update \(batchError), \(batchError!.userInfo)")
        }
        
        //fetchRequest = coreDataStack.model.fetchRequestTemplateForName("FetchRequest")
        
        // 可以将asyncFetchRequest看做是普通fetchRequest的一个warpper
        fetchRequest = NSFetchRequest(entityName: "Venue")
        
        // 异步请求由两部分组成：普通的request和completion handler
        // 返回结果在finalResult中
        asyncFetchRequest = NSAsynchronousFetchRequest(fetchRequest: fetchRequest, completionBlock: {
            [unowned self] (result: NSAsynchronousFetchResult!) -> Void in
            self.venues = result.finalResult as [Venue]
            self.tableView.reloadData()
        })
        
        // 执行异步请求调用executeRequest而不是executeFetchRequest
        var error: NSError?
        let results = coreDataStack.context.executeRequest(asyncFetchRequest, error: &error)
        
        // executeRequest会立即返回，这里我们在异步请求的completion handler中处理返回结果并更新table view
        if let persistentStoreResults = results {
            // return immediately, cancel here if you want
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
        
        fetchAndReload()
    }
  
    func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return venues.count
    }
  
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
      
        var cell = tableView.dequeueReusableCellWithIdentifier("VenueCell") as UITableViewCell
        
        let venue = venues[indexPath.row]
        
        cell.textLabel!.text = venue.name
        cell.detailTextLabel!.text = venue.priceInfo.priceCategory
      
        return cell
    }
  
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        if segue.identifier == "toFilterViewController" {
      
            let navController = segue.destinationViewController as UINavigationController
            let filterVC = navController.topViewController as FilterViewController
            
            filterVC.coreDataStack = coreDataStack
            filterVC.delegate = self
        }
    }
  
    @IBAction func unwindToVenuListViewController(segue: UIStoryboardSegue) {
        
    }
    
    //MARK: - 辅助函数
    func fetchAndReload() {
        var error: NSError?
        let results = coreDataStack.context.executeFetchRequest(fetchRequest, error: &error) as [Venue]?
        
        if let fetchResults = results {
            venues = fetchResults
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
        
        tableView.reloadData()
    }
    
    //MARK: - FilterViewControllerDelegate methods
    func filterViewController(filter: FilterViewController, didSelectPredicate predicate: NSPredicate?, sortDescriptor: NSSortDescriptor?) {
        fetchRequest.predicate = nil
        fetchRequest.sortDescriptors = nil
        
        if let fetchPredicate = predicate {
            fetchRequest.predicate = fetchPredicate
        }
        
        if let sr = sortDescriptor {
            fetchRequest.sortDescriptors = [sr]
        }
        
        fetchAndReload()
    }
}

