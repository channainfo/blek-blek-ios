//
//  TapToClose.swift
//  blekmes
//
//  Created by InSTEDD on 4/6/15.
//  Copyright (c) 2015 blekey. All rights reserved.
//

import Foundation
import UIKit

class TapToClose {

  var viewController: UIViewController!

  init(viewController: UIViewController){
    self.viewController = viewController

    let tapRecognizer = UITapGestureRecognizer()
    tapRecognizer.addTarget(self.viewController, action: "closeKeyboard")
    self.viewController.view.addGestureRecognizer(tapRecognizer)
  }
}
