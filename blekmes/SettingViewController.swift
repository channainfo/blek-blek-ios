//
//  SettingViewController.swift
//  blekmes
//
//  Created by InSTEDD on 4/8/15.
//  Copyright (c) 2015 blekey. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

  @IBAction func signOutTap(sender: AnyObject) {
    let signInViewController = self.storyboard?.instantiateViewControllerWithIdentifier("sign_in_view_controller") as! UIViewController
    self.presentViewController(signInViewController, animated: true, completion: nil)
    
    Session.signOut()
  }
}
