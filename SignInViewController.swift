//
//  SignInViewController.swift
//  blekmes
//
//  Created by InSTEDD on 4/6/15.
//  Copyright (c) 2015 blekey. All rights reserved.
//

import UIKit

class SignInViewController: BaseViewController {

  @IBOutlet weak var loginTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!

  @IBOutlet weak var signInButton: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    AppAccess.auth({ () -> () in
      println("Connected successfully")
    }, onError: { () -> () in
      println("Failed to connect, try again")
    })
  }

  @IBAction func credentialDoneEditing(sender: AnyObject) {
    self.loginTextField.resignFirstResponder()
    self.passwordTextField.resignFirstResponder()
  }


  @IBAction func signIn(sender: UIButton) {
    var login = self.loginTextField.text
    var password = self.passwordTextField.text
    var session = Session(login: login, password: password)
    
    User.auth(login, password: password, onSuccess: { (jsonData) -> Void in
      println("Signin success with: \(jsonData)")
      
      let mainViewController = self.storyboard?.instantiateViewControllerWithIdentifier("main_view_controller") as! UITabBarController
      let DEFAULT_VIEW_CONTROLLER_INDEX = 2
      mainViewController.selectedIndex = DEFAULT_VIEW_CONTROLLER_INDEX
      self.presentViewController(mainViewController, animated: true, completion: nil)


    }) { (statusCode) -> Void in
      println("Failed with code: \(statusCode)")
    }
    

  }


}
