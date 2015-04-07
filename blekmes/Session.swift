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
              }

    }
  }
}
