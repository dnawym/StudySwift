//
//  ViewController.swift
//  WorldCup
//
//  Created by Pietro Rea on 8/2/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, NSFetchedResultsControllerDelegate {
  
  var coreDataStack: CoreDataStack!
  
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    var fetchedResultsController: NSFetchedResultsController!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        //  创建fetch request
        let fetchRequest = NSFetchRequest(entityName: "Team")
        
        let zoneSort =
        NSSortDescriptor(key: "qualifyingZone", ascending: true)
        let scoreSort =
        NSSortDescriptor(key: "wins", ascending: false)
        let nameSort =
        NSSortDescriptor(key: "teamName", ascending: true)
        fetchRequest.sortDescriptors = [zoneSort, scoreSort, nameSort]
        
        // 创建Controller，提供执行上下文-managedObjectContext
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: coreDataStack.context, sectionNameKeyPath: "qualifyingZone", cacheName: "worldCup")
        
        fetchedResultsController.delegate = self
        
        // 执行fetch request
        var error: NSError? = nil
        if (!fetchedResultsController.performFetch(&error)) {
            println("Error: \(error?.localizedDescription)")
        }
    }
  
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
      
        return fetchedResultsController.sections!.count
    }
  
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = fetchedResultsController.sections![section] as NSFetchedResultsSectionInfo
        
        return sectionInfo.numberOfObjects
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      
        let resuseIdentifier = "teamCellReuseIdentifier"
      
        var cell = tableView.dequeueReusableCellWithIdentifier(resuseIdentifier, forIndexPath: indexPath) as TeamCell
      
        configureCell(cell, indexPath: indexPath)
        
        return cell
    }
  
    func configureCell(cell: TeamCell, indexPath: NSIndexPath) {
        let team = fetchedResultsController.objectAtIndexPath(indexPath) as Team
        
        cell.flagImageView.image = UIImage(named: team.imageName)
        cell.teamLabel.text = team.teamName
        cell.scoreLabel.text = "Wins: \(team.wins)"
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionInfo = fetchedResultsController.sections![section] as NSFetchedResultsSectionInfo
        return sectionInfo.name
    }
  
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let team = fetchedResultsController.objectAtIndexPath(indexPath) as Team
        
        let wins = team.wins.integerValue
        team.wins = NSNumber(integer: wins + 1)
        coreDataStack.saveContext()
        
        // tableView.reloadData()
    }
    
//    func controllerDidChangeContent(controller: NSFetchedResultsController) {
//            tableView.reloadData()
//    }
    
    // 变化即将发生，调用beginUpdates可以让一些列变化同时以动画的方式发生
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    
    // 哪些object发生了什么样的变化（插入，删除，更新还是移动）以及会影响哪些index
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath!, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath!) {
        switch type {
            case .Insert:
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Automatic)
            case .Delete:
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            case .Update:
                let cell = tableView.cellForRowAtIndexPath(indexPath) as TeamCell
                configureCell(cell, indexPath: indexPath)
            case .Move:
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Automatic)
            default:
                break
        }
    }
    
    // 应用这些变化
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeSection sectionInfo: NSFetchedResultsSectionInfo, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
        let indexSet = NSIndexSet(index: sectionIndex)
        
        switch type {
        case .Insert:
            tableView.insertSections(indexSet, withRowAnimation: .Automatic)
        case .Delete:
            tableView.deleteSections(indexSet, withRowAnimation: .Automatic)
        default:
            break
        }
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        if motion == .MotionShake {
            addButton.enabled = true
        }
    }
    
    @IBAction func addTeam(sender: AnyObject) {
        var alert = UIAlertController(title: "Secret Team", message: "Add a new team", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addTextFieldWithConfigurationHandler{(textField: UITextField!) in
            textField.placeholder = "Team Name"
        
        }
        alert.addTextFieldWithConfigurationHandler{(textField: UITextField!) in
            textField.placeholder = "Qualifying Zone"
        
        }
        
        alert.addAction(UIAlertAction(title: "Save", style: .Default, handler: {
            (action: UIAlertAction!) in
            println("Saved")
            
            let nameTextField = alert.textFields![0] as UITextField
            let zoneTextField = alert.textFields![1] as UITextField
            
            let team = NSEntityDescription.insertNewObjectForEntityForName("Team", inManagedObjectContext: self.coreDataStack.context) as Team
            
            team.teamName = nameTextField.text
            team.qualifyingZone = zoneTextField.text
            team.imageName = "wenderland-flag"
            
            self.coreDataStack.saveContext()
            }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: {
                (action: UIAlertAction!) in
                println("Cancel")
                }))
        
        presentViewController(alert, animated: true, completion: nil)
    }
}

