//
//  ViewController.swift
//  faceevents-social
//
//  Created by Asim Ahmed on 5/3/17.
//  Copyright © 2017 Asim Ahmed. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase


class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    @IBAction func facebookBtnTapped(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("ASIM: Unable to authenticate with Facebook - \(error)")
            } else if result?.isCancelled == true {
                print("ASIM: User cancelled Facebook authentication")
            } else {
                print("ASIM: Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }

    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("ASIM: Unable to authenticate with Firebase - \(error)")
            } else {
                print("ASIM: Successfully authenticated with Firebase")
               // if let user = user {
                   // let userData = ["provider": credential.provider]
                    //self.completeSignIn(id: user.uid, userData: userData)
               // }
            }
        })
    }

    
    
   
    

    
}


