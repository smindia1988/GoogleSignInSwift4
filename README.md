# GoogleSignInSwift4
Google SignIn with Block based structure, Swift 4 support

## Steps:
- Add single class SMGoogleSignIn+Block.swift into your project

- Get an OAuth client ID
https://developers.google.com/identity/sign-in/ios/start-integrating

- Replace your Client ID into SMGoogleSignIn+Block.swift  > func initalise() 

- Add a URL scheme to your project like this: 

https://developers.google.com/identity/sign-in/ios/images/xcode_infotab_url_type_values.png

    Google Sign-in requires a custom URL Scheme to be added to your project. To add the custom scheme:

    Open your project configuration: double-click the project name in the left tree view. Select your app from the TARGETS section, then select the Info tab, and expand the URL Types section.

    Click the + button, and add your reversed client ID as a URL scheme.

    The reversed client ID is your client ID with the order of the dot-delimited fields reversed. For example:

    com.googleusercontent.apps.1234567890-abcdefg

- Put Open URL delegate methods into your project delegate class. Methods are added in AppDelegate.swift

## How to use?

**Sign-In:**

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
    
    
**Sign-Out:**

@IBAction func didTapSignOut(_ sender: AnyObject) {

        SMGoogleSignIn.sharedInstance.signOut()
        
    } 
    
**Help Guide:** 

 Google Sign-In Integration:
 
 https://developers.google.com/identity/sign-in/ios/start?ver=swift
 
 https://developers.google.com/identity/sign-in/ios/start-integrating
 
 https://developers.google.com/identity/sign-in/ios/sign-in?ver=swift
 
 
 Open URL Methods Error Fixes:
 
 https://firebase.google.com/docs/auth/ios/google-signin
