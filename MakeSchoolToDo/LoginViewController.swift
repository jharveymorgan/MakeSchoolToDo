//
//  LoginViewController.swift
//  MakeSchoolToDo
//
//  Created by Jordan Harvey-Morgan on 7/10/17.
//  Copyright © 2017 Jordan Harvey-Morgan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    // MARK: - Properties
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBActions
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        guard let email = emailTextField.text, email.isEmpty == false else {
            return
        }
        
        guard let password = passwordTextField.text, password.isEmpty == false else {
            return
        }
        
        UserService.loginUser(email: email, password: password)
    }
    
    @IBAction func exitButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
