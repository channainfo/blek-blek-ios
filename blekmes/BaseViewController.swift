//
//  BaseViewController.swift
//  blekmes
//
//  Created by InSTEDD on 4/7/15.
//  Copyright (c) 2015 blekey. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabToClose()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    private func tabToClose() {
      let tapGestureRecognizer = UITapGestureRecognizer()
      tapGestureRecognizer.addTarget(self, action: "closeKeyboard" )
      self.view.addGestureRecognizer(tapGestureRecognizer)
    }

    func closeKeyboard() {
      self.view.endEditing(true)
    }


}
