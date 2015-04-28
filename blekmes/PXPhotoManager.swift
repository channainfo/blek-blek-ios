//
//  PXPhotoManager.swift
//  blekmes
//
//  Created by InSTEDD on 4/1/15.
//  Copyright (c) 2015 blekey. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PXPhotoManager: NSObject {

  func getPhotos(var params: [String: String], completion: (photos: [PXPhoto], error: NSError?) ->()) {
    params["consumer_key"] = AppConfig.PX_API_KEY

    Alamofire.request(.GET, AppConfig.PX_API_URL, parameters: params, encoding: ParameterEncoding.URL)
             .responseJSON { (request, response, data, error) -> Void in
                let jsonData = JSON(data!)
                var photos = [PXPhoto]()

                for(_,photoData) in jsonData["photos"] {
                  let newPhoto: PXPhoto = PXPhoto(data: photoData)
                  photos.append(newPhoto)
                }
                completion(photos: photos, error: error)
    }
  }
}
