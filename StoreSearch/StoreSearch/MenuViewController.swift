//
//  MenuViewController.swift
//  StoreSearch
//
//  Created by wuyaming on 14-11-30.
//  Copyright (c) 2014年 yaming. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {

    weak var delegate: MenuViewControllerDelegate?

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            delegate?.menuViewControllerSendSupportEmail(self)
        }
    }
}

protocol MenuViewControllerDelegate: class {
    func menuViewControllerSendSupportEmail(MenuViewController)
}