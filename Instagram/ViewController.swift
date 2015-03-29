//
//  ViewController.swift
//  Instagram
//
//  Created by Joshua Raichur on 3/27/15.
//  Copyright (c) 2015 Joshua Raichur. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var signUpActive = true
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    func displayAlert(title: String, error: String) {
        var alert = UIAlertController(title: title, message: error, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { action in
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signUpToggleButton: UIButton!
    
    
    @IBAction func toggleSignUp(sender: AnyObject) {
        
        if signUpActive == true {
            signUpActive = false
            signUpButton.setTitle("Log In", forState: UIControlState.Normal)
            signUpToggleButton.setTitle("Sign Up", forState: UIControlState.Normal)
            
        } else {
            signUpActive = true
            signUpToggleButton.setTitle("Log In", forState: UIControlState.Normal)
            signUpButton.setTitle("Sign Up", forState: UIControlState.Normal)
        }
        
    }
    
    @IBAction func signUp(sender: AnyObject) {
        
        var error = ""
        
        if username.text == "" || password.text == "" {
            if username.text == "" && password.text != "" {
                error = "Please enter a username"
            } else if username.text != "" && password.text == "" {
                error = "Please enter a password"
            } else if username.text == "" && password.text == "" {
                error = "Please enter a username and password"
            }
        }
        
        if error != "" {
            displayAlert("Error In Form", error: error)
        } else {
            var user = PFUser()
            user.username = username.text
            user.password = password.text
            
            activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
            
            user.signUpInBackgroundWithBlock {(succeeded: Bool!, signUpError: NSError!) -> Void in
                
                self.activityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
                if signUpError == nil {
                    
                } else {
                    if let errorString = signUpError.userInfo?["error"] as? NSString {
                        error = errorString
                    } else {
                        error = "Please try again later"
                    }
                    self.displayAlert("Error Signing Up", error: error)
                }
            
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

