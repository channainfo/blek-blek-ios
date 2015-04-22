//
//  PersistentStorage.swift
//  blekmes
//
//  Created by InSTEDD on 4/8/15.
//  Copyright (c) 2015 blekey. All rights reserved.
//

import Foundation

class PersistentStorage {
  var dataSource: NSUserDefaults!
  static let sharedInstance = PersistentStorage()

  init() {
    self.dataSource = NSUserDefaults.standardUserDefaults()
  }

  func set(key:String, value: AnyObject?)-> Void {
    self.dataSource.setObject(value, forKey: key)
  }

  func get(key: String) -> AnyObject? {
    return self.dataSource.objectForKey(key)
  }
}
