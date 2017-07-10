//
//  SignUpViewController.swift
//  MakeSchoolToDo
//
//  Created by Jordan Harvey-Morgan on 7/10/17.
//  Copyright © 2017 Jordan Harvey-Morgan. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    // MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBActions
    @IBAction func signupButtonPressed(_ sender: Any) {
        
        guard let fullName = fullNameTextField.text, fullName.isEmpty == false else {
            return
        }
        
        guard let email = emailTextField.text, email.isEmpty == false else {
            return
        }
        
        guard let password = passwordTextField.text, password.isEmpty == false else {
            return
        }
        
        UserService.createUser(fullName: fullName, email: email, password: password)
        
    }

    @IBAction func exitButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
