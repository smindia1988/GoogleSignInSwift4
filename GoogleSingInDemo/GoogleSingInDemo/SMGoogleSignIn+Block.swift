//
//  GoogleSignIn+Block.swift
//  GoogleSingInDemo
//
//  Created by Sadnip Patel (SM) on 06/06/18.
//  Copyright © 2018 BV. All rights reserved.
//
/*
 Help Guide:
 Google Sign-In Integration:
 https://developers.google.com/identity/sign-in/ios/start?ver=swift
 https://developers.google.com/identity/sign-in/ios/start-integrating
 https://developers.google.com/identity/sign-in/ios/sign-in?ver=swift
 
 Open URL Methods Error Fixes:
 https://firebase.google.com/docs/auth/ios/google-signin
*/


import UIKit
import GoogleSignIn

typealias SignInCompletionHandler = ((_ signIn:GIDSignIn?, _ user:GIDGoogleUser?, _ error:Error?)->())?

class SMGoogleSignIn: NSObject, GIDSignInDelegate, GIDSignInUIDelegate {

    
    static let sharedInstance = SMGoogleSignIn()
    var globalHandler : SignInCompletionHandler!
    let topVC = (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController
    
    //MARK:- Custom methods
    
    override init() {
        super.init()
        initalise()
    }
    
    func initalise(){
        // Initialize Google Sign-In
        GIDSignIn.sharedInstance().clientID = "YOUR_CLIENT_ID"
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    func signIn(handler:SignInCompletionHandler){
        
        globalHandler = handler
        
        // Uncomment to automatically sign in the user.
        //GIDSignIn.sharedInstance().signInSilently()
        
        GIDSignIn.sharedInstance().signIn()        
    }
    
    func signOut(){
        GIDSignIn.sharedInstance().signOut()
        print("Google SignOut Called")
    }
    
    
    //MARK:- GIDSignInDelegate Methods
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        globalHandler!!(signIn, user, error)
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        globalHandler!!(signIn, user, error)
    }
    
    //MARK:- Google Screen Presenting Methods
    // Present a view that prompts the user to sign in with Google
    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        
        topVC?.present(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func sign(_ signIn: GIDSignIn!,
              dismiss viewController: UIViewController!) {
        topVC?.dismiss(animated: true, completion: nil)
    }
    
    //MARK:- GIDSignInUIDelegate Methods
    // Note: This method called when default Google Sing-In button pressed
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        // Stop the UIActivityIndicatorView animation that was started when the user
        //myActivityIndicator.stopAnimating()
        
        print("Google Sign-In With Default Button Pressed")
    }
}
