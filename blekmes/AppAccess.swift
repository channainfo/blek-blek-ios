//
//  AppAccess.swift
//  blekmes
//
//  Created by InSTEDD on 4/22/15.
//  Copyright (c) 2015 blekey. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AppAccess {
  class func auth(onSuccess: ()-> (), onError: ()->() )-> Void {
    let parameters = [ "client_id": AppConfig.API_CLIENT_ID,
                       "client_secret": AppConfig.API_CLIENT_SECRET,
                       "grant_type": "client_credentials"
    ]
    
    Alamofire.request(.POST, "\(AppConfig.API_HOST)/oauth/token", parameters: parameters, encoding: ParameterEncoding.URL)
      .responseJSON() { (request, response, json, error) in

        if response?.statusCode != 200 {
          println("Failed")

        }
        else {
          PersistentStorage.sharedInstance.set(AppConfig.APP_AUTH_TOKEN, value: json!["access_token"])
          println("token is:\(PersistentStorage.sharedInstance.get(AppConfig.APP_AUTH_TOKEN))")

        }
    }

  }
  
  class var appAccessToken: String? {
    return PersistentStorage.sharedInstance.get(AppConfig.APP_AUTH_TOKEN) as? String
  }
}