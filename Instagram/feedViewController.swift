
//
//  feedViewController.swift
//  Instagram
//
//  Created by Joshua Raichur on 4/11/15.
//  Copyright (c) 2015 Joshua Raichur. All rights reserved.
//

import UIKit

class feedViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
//        
//        if following.count > indexPath.row {
//            if following[indexPath.row] {
//                cell.accessoryType = UITableViewCellAccessoryType.Checkmark
//            }
//        }
//        
//        cell.textLabel?.text = users[indexPath.row]
//        return cell
//    }
//    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        var cell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
//        if cell.accessoryType == UITableViewCellAccessoryType.Checkmark {
//            cell.accessoryType = UITableViewCellAccessoryType.None
//            
//            var query = PFQuery(className: "Followers")
//            query.whereKey("follower", equalTo: PFUser.currentUser().username)
//            query.whereKey("following", equalTo: cell.textLabel?.text)
//            query.findObjectsInBackgroundWithBlock {
//                (objects: [AnyObject]!, error: NSError!) -> Void in
//                if error == nil {
//                    for object in objects {
//                        object.delete()
//                    }
//                } else {
//                    
//                }
//            }
//            
//        } else {
//            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
//            var following = PFObject(className: "Followers")
//            following["following"] = cell.textLabel?.text
//            following["follower"] = PFUser.currentUser().username!
//            following.saveInBackgroundWithBlock(nil)
//        }
//    }
//    
}
