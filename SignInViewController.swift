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
