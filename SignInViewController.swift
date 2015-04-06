//
//  SignInViewController.swift
//  blekmes
//
//  Created by InSTEDD on 4/6/15.
//  Copyright (c) 2015 blekey. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

  @IBOutlet weak var loginTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!

  @IBOutlet weak var signInButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        //TapToClose(viewController: self)

//        self.signInButton.backgroundColor = UIColor.clearColor()
//        self.signInButton.layer.cornerRadius = 5
//        self.signInButton.layer.borderWidth = 1
//        self.signInButton.layer.borderColor = UIColor.grayColor().CGColor
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   func closeKeyboard(){
      self.view.endEditing(true)
   }

  @IBAction func credentialDoneEditing(sender: AnyObject) {
    println("Done")
    self.loginTextField.resignFirstResponder()
    self.passwordTextField.resignFirstResponder()
  }


  @IBAction func signIn(sender: UIButton) {
    var login = self.loginTextField.text
    var password = self.passwordTextField.text
    var session = Session(login: login, password: password)
    session.auth()

  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
