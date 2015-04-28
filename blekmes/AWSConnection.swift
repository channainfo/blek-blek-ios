//
//  AWSConnection.swift
//  blekmes
//
//  Created by InSTEDD on 4/6/15.
//  Copyright (c) 2015 blekey. All rights reserved.
//

import Foundation

class AWSConnection {
  init(){
    let credentialsProvider = AWSCognitoCredentialsProvider(regionType: AppConfig.AWS_COGNITO_REGION_TYPE, identityPoolId: AppConfig.AWS_COGNITO_IDENTITY_POOL_ID)
    let configuration  = AWSServiceConfiguration(region: AppConfig.AWS_DEFAULT_SERVICE_REGION_TYPE, credentialsProvider: credentialsProvider)
    AWSServiceManager.defaultServiceManager().defaultServiceConfiguration = configuration
  }
}
