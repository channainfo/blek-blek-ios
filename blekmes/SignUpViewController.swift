//
//  SignUpViewController.swift
//  blekmes
//
//  Created by InSTEDD on 4/21/15.
//  Copyright (c) 2015 blekey. All rights reserved.
//

import UIKit

class SignUpViewController: BaseViewController {

  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  @IBAction func signupTapped() {
    let firstName = self.firstNameTextField.text
    let lastName = self.lastNameTextField.text
    let email = self.emailTextField.text
    let password = self.passwordTextField.text
    
    
    
    let user: User = User(firstName: firstName, lastName: lastName, email: email, username: email, password: password)
    user.register({ (dataJson) -> () in
       let mainViewController = self.storyboard?.instantiateViewControllerWithIdentifier("main_view_controller") as! UITabBarController
       self.presentViewController(mainViewController, animated: true, completion: nil)
      
    }, onError: { (statusCode) -> () in
       println("Failed to login")
    })
  }
  
  
  
}
