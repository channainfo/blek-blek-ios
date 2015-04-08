//
//  PresentStoryBoard.swift
//  blekmes
//
//  Created by InSTEDD on 4/6/15.
//  Copyright (c) 2015 blekey. All rights reserved.
//

import Foundation

struct PresentStoryBoard {
  static func setRootViewController(viewControllerId: String, appDelegate: AppDelegate) -> Void {

    var uiStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    var initialViewController = uiStoryBoard.instantiateViewControllerWithIdentifier(viewControllerId) as? UIViewController
    // var navigationController = UINavigationController(rootViewController: initialViewController!)

    appDelegate.window = UIWindow(frame: UIScreen.mainScreen().bounds)
    appDelegate.window?.rootViewController = initialViewController
    appDelegate.window?.makeKeyAndVisible()

  }

}
