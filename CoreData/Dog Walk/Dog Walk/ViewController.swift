//
//  ViewController.swift
//  Dog Walk
//
//  Created by Pietro Rea on 7/10/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var walks:Array<NSDate> = []
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
  
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return walks.count;
    }
  
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "List of Walks";
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
    
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        dateFormatter.timeStyle = .MediumStyle
    
        let date =  walks[indexPath.row]
        cell.textLabel!.text = dateFormatter.stringFromDate(date)
    
        return cell
    }
  
    @IBAction func add(sender: AnyObject) {
        walks.append(NSDate())
        tableView.reloadData()
    }
    
}

