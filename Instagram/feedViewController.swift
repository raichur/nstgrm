
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
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 400
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var myCell: cell = self.tableView.dequeueReusableCellWithIdentifier("myCell") as cell
        
        myCell.title.text = "My title"
        myCell.username.text = "Rob"
        
        return myCell
    }
    
}
