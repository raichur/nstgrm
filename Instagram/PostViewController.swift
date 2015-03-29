//
//  postViewController.swift
//  Instagram
//
//  Created by Joshua Raichur on 3/29/15.
//  Copyright (c) 2015 Joshua Raichur. All rights reserved.
//

import UIKit

class postViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var photoSelected = false
    var firstTime = true
    
    @IBOutlet weak var imageToPost: UIImageView!
    @IBOutlet weak var shareText: UITextField!
    
    @IBAction func chooseImage(sender: AnyObject) {
        var image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = false
        
        self.presentViewController(image, animated: true, completion: nil)
    }
    
    @IBAction func postImage(sender: AnyObject) {
        var error = ""
        
        if(photoSelected == false) {
            error = "Please select an image to post"
        }
        if error != "" {
            displayAlert("Cannot post image", error: error)
        } else {
            
            var post = PFObject(className: "Post")
            post["caption"] = shareText.text
            post["username"] = PFUser.currentUser().username
            
            post.saveInBackgroundWithBlock {(success: Bool!, error: NSError!) -> Void in
                if success == false {
                    self.displayAlert("Could not post image", error: "Please try again later")
                } else {
                    let imageData = UIImagePNGRepresentation(self.imageToPost.image)
                    let imageFile = PFFile(name: "image.png", data: imageData)
                    post["image"] = imageFile
                    post.saveInBackgroundWithBlock {
                        (success: Bool!, error: NSError!) -> Void in
                    if success == false {
                        self.displayAlert("Could not post image", error: "Please try again later")
                    } else {
                        self.displayAlert("Image posted!", error: "Your image has been posted successfully")
                        self.photoSelected = false
                        self.imageToPost.image = nil
                        self.shareText.text = ""
                    }
                }
            }
        }
      }
    }
    
    func displayAlert(title: String, error: String) {
        var alert = UIAlertController(title: title, message: error, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { action in
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        self.dismissViewControllerAnimated(true, completion: nil)
        imageToPost.image = image
        photoSelected = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoSelected = false
        imageToPost.image = nil
        shareText.text = ""
    }
    
    override func viewDidAppear(animated: Bool) {
        if(firstTime == true) {
            var image = UIImagePickerController()
            image.delegate = self
            image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            image.allowsEditing = false
            
            self.presentViewController(image, animated: true, completion: nil)
            firstTime = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
