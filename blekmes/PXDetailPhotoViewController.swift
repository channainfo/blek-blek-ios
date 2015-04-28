//
//  PXDetailPhotoViewController.swift
//  blekmes
//
//  Created by InSTEDD on 4/27/15.
//  Copyright (c) 2015 blekey. All rights reserved.
//

import UIKit

class PXDetailPhotoViewController: UIViewController, UIScrollViewDelegate {
  
  var pxPhoto: PXPhoto! {
    didSet {
      self.image = nil
      if(view.window != nil) {
        fetchImage()
      }
      
    }
  }
  
  var image: UIImage? {
    get {
      return self.imageView.image
    }
    set {
      self.imageView?.image = newValue
      //automatically change the frame
      self.imageView?.sizeToFit()
      self.scrollImage?.contentSize = self.imageView!.frame.size
      println("Content size: \(self.scrollImage?.contentSize)")
    }
  }
  
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var scrollImage: UIScrollView! {
    didSet{
      self.scrollImage.contentSize = self.imageView.frame.size
      self.scrollImage.delegate = self
      self.scrollImage.minimumZoomScale = 0.2
      self.scrollImage.maximumZoomScale = 2.0
      
    }
  }
  
  func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
    return self.imageView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.updateUI()
    self.scrollImage.addSubview(self.imageView)
    self.scrollImage.showsHorizontalScrollIndicator = false
    self.scrollImage.showsVerticalScrollIndicator = false
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(true)
    if image == nil {
      fetchImage()
    }
  }

  func updateUI(){
    println("\n UIPhoto: \(pxPhoto.name)")
    self.title = self.pxPhoto.name
    self.activityIndicator.hidesWhenStopped = true
    self.activityIndicator.startAnimating()
    
  }
  
  func fetchImage() {
    if let url = self.pxPhoto.imageurl {
      
      let qos = Int(QOS_CLASS_USER_INITIATED.value)
      let queue = dispatch_get_global_queue(qos, 0)
      dispatch_async(queue) {
        if let imageData = NSData(contentsOfURL: NSURL(string: url)!) {
          dispatch_async( dispatch_get_main_queue())  {
            self.image = UIImage(data: imageData)
            self.activityIndicator.stopAnimating()
          }
          
        }
      }
    }
  }
}
