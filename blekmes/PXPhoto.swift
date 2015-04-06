//
//  PXPhoto.swift
//  blekmes
//
//  Created by InSTEDD on 4/1/15.
//  Copyright (c) 2015 blekey. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire



class PXPhoto: NSObject {
  var name: String?
  var info: String?
  var camera: String?
  var lens: String?
  var focalLength: String?
  var iso:String?
  var shutterSpeed: String?
  var highestRating: Double?
  var imageurl: String?

  init(data: JSON) {
    self.name = data["name"].stringValue
    self.info = data["description"].stringValue
    self.camera = data["camera"].stringValue
    self.lens  = data["length"].stringValue
    self.focalLength = data["focal_length"].stringValue
    self.iso = data["iso"].stringValue
    self.shutterSpeed = data["shutter_speed"].stringValue
    self.highestRating = data["highest_rating"].doubleValue
    self.imageurl = data["images"][0]["url"].stringValue

  }


}
