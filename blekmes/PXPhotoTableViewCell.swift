//
//  PXPhotoTableViewCell.swift
//  blekmes
//
//  Created by InSTEDD on 4/1/15.
//  Copyright (c) 2015 blekey. All rights reserved.
//

import UIKit

class PXPhotoTableViewCell: UITableViewCell {


  @IBOutlet weak var posterImageView: UIImageView!
  @IBOutlet weak var blurEffect: UIVisualEffectView!
  @IBOutlet weak var camera: UILabel!
  @IBOutlet weak var lens: UILabel!

  @IBOutlet weak var iso: UILabel!
  @IBOutlet weak var focalLens: UILabel!
  @IBOutlet weak var shutterSpeed: UILabel!
  @IBOutlet weak var imageLoading: UIImageView!
  @IBOutlet weak var photoActivityIndicator: UIActivityIndicatorView!
  
  
}
