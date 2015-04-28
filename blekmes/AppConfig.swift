//
//  Secret.swift
//  blekmes
//
//  Created by InSTEDD on 4/1/15.
//  Copyright (c) 2015 blekey. All rights reserved.
//

import Foundation

struct AppConfig {
  static let PX_API_KEY: String = "CRaX0Nx23HXjHI4bncSw7cEiHHGzB8AUHH4JUCwA"
  static let PX_API_URL: String = "https://api.500px.com/v1/photos/search"

  static let API_HOST:String = "http://192.168.1.102:3000"
  static let API_URL:String = "http://192.168.1.102:3000/api/v1"

  static let API_CLIENT_ID = "7aa96dc9c3fb8ef2a8e6c097ccfe5088d2eca01fa3227ef894400f34993440d2"
  static let API_CLIENT_SECRET = "53b9c6adf90db402d69ebbf5aa5e0cd97d250bde34f31fd46883ef55cc28023f"

  static let AWS_COGNITO_REGION_TYPE = AWSRegionType.USEast1
  static let AWS_DEFAULT_SERVICE_REGION_TYPE = AWSRegionType.USEast1
  static let AWS_COGNITO_IDENTITY_POOL_ID = "us-east-1:9a999ffb-5392-4978-9a03-89ec116c7422"
  static let AWS_S3_BUCKET_NAME = "blekmes-dev"

  static let APP_SESSION_ID = "user_session_name"
  static let APP_AUTH_TOKEN = "app_auth_token"
  
}

