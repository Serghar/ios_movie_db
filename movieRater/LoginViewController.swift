//
//  LoginViewController.swift
//  movieRater
//
//  Created by Dylan Sharkey on 5/18/17.
//  Copyright © 2017 Dylan Sharkey. All rights reserved.
//

import UIKit
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInUIDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
//        GIDSignIn.sharedInstance().signInSilently()
    }
    
    
    // The sign-in flow has finished selecting how to proceed, and the UI should no longer display
    // a spinner or other "please wait" element.
    public func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        
    }
    
    @IBAction func SignInButtonPressed(_ sender: GIDSignInButton) {
    }
    
    // If implemented, this method will be invoked when sign in needs to display a view controller.
    // The view controller should be displayed modally (via UIViewController's |presentViewController|
    // method, and not pushed unto a navigation controller's stack.
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!){
        self.present(viewController, animated: true, completion: nil)
    }
    
    
    // If implemented, this method will be invoked when sign in needs to dismiss a view controller.
    // Typically, this should be implemented by calling |dismissViewController| on the passed
    // view controller.
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!){
        self.dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "loginSegue", sender: nil)
    }

    
}
