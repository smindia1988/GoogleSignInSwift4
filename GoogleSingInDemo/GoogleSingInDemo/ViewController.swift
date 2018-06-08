//
//  ViewController.swift
//  GoogleSingInDemo
//
//  Created by bviadmin on 06/06/18.
//  Copyright © 2018 BV. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController
{

    @IBOutlet weak var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK:- Google Sign-In custom methods
    @IBAction func didTapSignIn(_ sender: AnyObject) {
                               
        SMGoogleSignIn.sharedInstance.signIn { (signIn, user, error) in
                        
            if let error = error {
                print("\(error.localizedDescription)")
            } else {
                
                // Perform any operations on signed in user here.                
                if let userValue = user{
                    
                    let userId = userValue.userID                  // For client-side use only!
                    let idToken = userValue.authentication.idToken // Safe to send to the server
                    let fullName = userValue.profile.name
                    let givenName = userValue.profile.givenName
                    let familyName = userValue.profile.familyName
                    let email = userValue.profile.email
                    // ...
                    
                    print("User Id: \(String(describing: userId))")
                    print("idToken: \(String(describing: idToken))")
                    print("fullName: \(String(describing: fullName))")
                    print("givenName: \(String(describing: givenName))")
                    print("familyName: \(String(describing: familyName))")
                    print("email: \(String(describing: email))")
                }
            }
        }
    }
    @IBAction func didTapSignOut(_ sender: AnyObject) {
        SMGoogleSignIn.sharedInstance.signOut()
    }                
}

