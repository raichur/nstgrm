
//
//  feedViewController.swift
//  Instagram
//
//  Created by Joshua Raichur on 4/11/15.
//  Copyright (c) 2015 Joshua Raichur. All rights reserved.
//

import UIKit

class feedViewController: UITableViewController {
    
    var titles = [String]()
    var usernames = [String]()
    var images = [UIImage]()
    var imageFiles = [PFFile]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var getFollowedUsersQuery = PFQuery(className: "Followers")
        getFollowedUsersQuery.whereKey("follower", equalTo: PFUser.currentUser().username)
        getFollowedUsersQuery.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                var followedUser = ""
                for object in objects {
                    followedUser = object["following"] as String
                    
                    var query = PFQuery(className: "Post")
                    query.whereKey("username", equalTo: followedUser)
                    query.findObjectsInBackgroundWithBlock {
                        (objects: [AnyObject]!, error: NSError!) -> Void in
                        if error == nil {
                            for object in objects {
                                self.titles.append(object["caption"] as String)
                                self.usernames.append(object["username"] as String)
                                self.imageFiles.append(object["image"] as PFFile)
                                self.tableView.reloadData()
                                
                            }
                        } else {
                            
                        }
                    }
                }
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 400
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var myCell: cell = self.tableView.dequeueReusableCellWithIdentifier("myCell") as cell
        
        myCell.title.text = titles[indexPath.row]
        myCell.username.text = usernames[indexPath.row]
        
        imageFiles[indexPath.row].getDataInBackgroundWithBlock{
            (imageData: NSData!, error: NSError!) -> Void in
            
            if error == nil {
                let image = UIImage(data: imageData)
                myCell.postedImage.image = image
            }
            
        }
        
        return myCell
    }
    
}
