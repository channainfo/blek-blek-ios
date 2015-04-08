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
    PersistentStorage.sharedInstance.set(Secret.APP_SESSION_ID, value: json )
    println("Signin session with \(JSON(json!))")
  }

  class func signOut() {
    var data = JSON(PersistentStorage.sharedInstance.get(Secret.APP_SESSION_ID)!)
    println("destroying session: \(data)")
    PersistentStorage.sharedInstance.set(Secret.APP_SESSION_ID, value: nil)
  }

  class func authenticated() -> Bool {
    var session = PersistentStorage.sharedInstance.get(Secret.APP_SESSION_ID)
    return (session != nil) ? true : false
  }


  func auth(onSuccess: (data: AnyObject)->Void, onError: (statusCode: Int)->Void )-> Void {
    let parameters = [ "username": self.login, "password": self.password,
                       "grant_type": "password", "client_id": Secret.API_CLIENT_ID,
                       "client_secret": Secret.API_CLIENT_SECRET  ]

    Alamofire.request(.POST, "\(Secret.API_HOST)/oauth/token", parameters: parameters, encoding: ParameterEncoding.URL)
             .responseJSON { (request, response, json, error) -> Void in

              if response?.statusCode != 200 {
                onError(statusCode: response!.statusCode)
              }
              else {
                onSuccess(data: json!)
                Session.signIn(json)
              }

    }
  }
}
