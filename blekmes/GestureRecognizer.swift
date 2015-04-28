//
//  GestureRecognizer.swift
//  blekmes
//
//  Created by InSTEDD on 4/22/15.
//  Copyright (c) 2015 blekey. All rights reserved.
//

import Foundation
import UIKit


class GestureRecognizer {
  class func addTapRecognizer(#target: AnyObject, action: Selector, view: UIView) -> Void {
    var tapGestureRecognizer = UITapGestureRecognizer()
    
    tapGestureRecognizer.addTarget(target, action: action)
//    tapGestureRecognizer.delegate = target as? UIGestureRecognizerDelegate
    view.addGestureRecognizer(tapGestureRecognizer)
  }
}
