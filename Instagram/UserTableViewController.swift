//
//  UserTableViewController.swift
//  Instagram
//
//  Created by Joshua Raichur on 3/29/15.
//  Copyright (c) 2015 Joshua Raichur. All rights reserved.
//

import UIKit

class UserTableViewController: UITableViewController {
    
    var users = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var query = PFUser.query()
        query.findObjectsInBackgroundWithBlock({ (objects: [AnyObject]!, error: NSError!) -> Void in
            self.users.removeAll(keepCapacity: true)
            for object in objects {
                var user: PFUser = object as PFUser
                self.users.append(user.username)
            }
            self.tableView.reloadData()
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        cell.textLabel?.text = users[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSgitelectRowAtIndexPath indexPath: NSIndexPath) {
        var cell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        cell.accessoryType = UITableViewCellAccessoryType.Checkmark
    }
    
}
