//
//  UserService.swift
//  MakeSchoolToDo
//
//  Created by Jordan Harvey-Morgan on 7/10/17.
//  Copyright © 2017 Jordan Harvey-Morgan. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase

struct UserService {
    
    static func createUser(fullName: String, email: String, password: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            
            // if there's an error
            if error != nil {
                print("Error Signing Up: \(String(describing: error?.localizedDescription))")
                return
            }
            
            // if a user is created
            let values = ["email": email, "fullName": fullName]
            
            // check user exists, if so get the user's uid
            guard let uid = user?.uid else { return }
            
            // database reference
            let userRef = Database.database().reference().child("users").child(uid)
            
            // add user's name and email to our database
            userRef.updateChildValues(values, withCompletionBlock: { (error, ref) in
                if error != nil {
                    print("Error Updating Values: \(String(describing: error?.localizedDescription))")
                    return
                }
            })
            
            
            
        }
    }
    
    static func loginUser(email: String, password: String) {
    
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                print("Error Logging in: \(String(describing: error?.localizedDescription))")
                return
            }
            
            // if there user gets logged in, do some stuff
            
        }
        
    }
}
