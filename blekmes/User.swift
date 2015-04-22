//
//  Registration.swift
//  blekmes
//
//  Created by InSTEDD on 4/21/15.
//  Copyright (c) 2015 blekey. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class User {
  var firstName: String
  var lastName: String
  var email:String
  var password: String
  var username: String
  
  init(firstName: String, lastName:String, email: String, username:String, password: String) {
    self.firstName = firstName
    self.lastName = lastName
    self.email = email
    self.password = password
    self.username = username
  }
  
  func register(onSuccess: (data: AnyObject) -> (), onError: (statusCode:Int) ->()) {
    let parameters = [
      "full_name": self.firstName + " " + self.lastName,
      "email": self.email,
      "password": self.password,
      "user_name": self.username,
      "access_token": AppAccess.appAccessToken!
    ]
    
    Alamofire.request(.POST, "\(Secret.API_URL)/registrations", parameters: parameters, encoding: ParameterEncoding.URL)
      .responseJSON() { (request, response, json, error) in
        
        if response?.statusCode != 201 {
          onError(statusCode: response!.statusCode)
        }
        else {
          onSuccess(data: json!)
          Session.signIn(json)
        }
    }
    
  }
  
  class func auth(login:String, password:String, onSuccess: (data: AnyObject)->Void, onError: (statusCode: Int)->Void )-> Void {
    let parameters = [ "username": login, "password": password,
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
