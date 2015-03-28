//
//  ViewController.swift
//  Instagram
//
//  Created by Joshua Raichur on 3/27/15.
//  Copyright (c) 2015 Joshua Raichur. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var pickedImage: UIImageView!
    
    @IBAction func pickImage(sender: AnyObject) {
        var image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = false
        
        self.presentViewController(image, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        self.dismissViewControllerAnimated(true, completion: nil)
        pickedImage.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let parseInfo = ParseInfo()
        
//        Parse.setApplicationId(parseInfo.applicationId, clientKey: parseInfo.clientKey)
//        
//        var query = PFQuery(className: "score")
//        query.getObjectInBackgroundWithId("A6SCCczBCp") {
//            (score: PFObject!, error: NSError!) -> Void in
//            
//                if error == nil {
//                    score["name"] = "Joshua"
//                    score["number"] = 1337
//                    score.save()
//                } else {
//                    println(error)
//                }
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

