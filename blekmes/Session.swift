//
//  Session.swift
//  blekmes
//
//  Created by InSTEDD on 4/6/15.
//  Copyright (c) 2015 blekey. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Session {
  var login: String = ""
  var password: String = ""

  init(login:String, password: String) {
    self.login = login
    self.password = password
  }

  class func signIn(json: AnyObject?){
    PersistentStorage.sharedInstance.set(AppConfig.APP_SESSION_ID, value: json )
    println("Signin session with \(JSON(json!))")
  }

  class func signOut() {
    var data = JSON(PersistentStorage.sharedInstance.get(AppConfig.APP_SESSION_ID)!)
    println("destroying session: \(data)")
    PersistentStorage.sharedInstance.set(AppConfig.APP_SESSION_ID, value: nil)
  }

  class func authenticated() -> Bool {
    var session: AnyObject? = PersistentStorage.sharedInstance.get(AppConfig.APP_SESSION_ID)
    return (session != nil) ? true : false
  }

}
