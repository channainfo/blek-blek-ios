//
//  FirstViewController.swift
//  blekmes
//
//  Created by InSTEDD on 3/30/15.
//  Copyright (c) 2015 blekey. All rights reserved.
//

import UIKit

class PXPhotoViewController: UIViewController {

  let pxPhotoManager = PXPhotoManager()

  override func viewDidLoad() {
    super.viewDidLoad()
    storeUserDefault()
//    loadPxPhotos()

  }

  func loadPxPhotos() {
    var params: [String:String] = ["only":"Landscapes","image_size":"4"]
    self.pxPhotoManager.getPhotos(params, completion: processPhotos)
  }

  func processPhotos(photos: [PXPhoto], error: NSError?) {
    for photo in photos {
      println("\(photo.name!), url: \(photo.imageurl!)")
    }
  }

  func storeUserDefault() {
    var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var fetchName = defaults.objectForKey("APP_NAME") as? String
    if let appName = fetchName {
      println("Loading: object \(appName)")

    }
    else{
      println("Setting config")
      defaults.setObject("Blekmes", forKey: "APP_NAME")
    }
  }


}

