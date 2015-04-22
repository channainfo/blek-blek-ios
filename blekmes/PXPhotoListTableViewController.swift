//
//  PhotoListTableViewController.swift
//  blekmes
//
//  Created by InSTEDD on 4/1/15.
//  Copyright (c) 2015 blekey. All rights reserved.
//

import UIKit

class PXPhotoListTableViewController: UITableViewController {
  
  var pxPhotoManager: PXPhotoManager = PXPhotoManager()
  var photos: [PXPhoto] = []
  

    func loadPxPhotos() {
      println("load Px Photos")
      var params: [String:String] = ["only":"Landscapes","image_size":"4"]
      self.pxPhotoManager.getPhotos(params, completion: processPhotos)
    }

    func processPhotos(photos: [PXPhoto], error: NSError?) {
      self.photos.removeAll(keepCapacity: false)
      for photo in photos {
        self.photos.append(photo)
        println("photo name: \(photo.camera!)")
      }

      println("total photo count: \(self.photos.count)")
      self.tableView.reloadData()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadPxPhotos()




        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        println("total photo count: \(self.photos.count)")
        return self.photos.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cell:PXPhotoTableViewCell = tableView.dequeueReusableCellWithIdentifier("pxPhotoCell", forIndexPath: indexPath) as! PXPhotoTableViewCell

        let photo = self.photos[indexPath.row]

        cell.posterImageView.image = nil
        cell.posterImageView.userInteractionEnabled = true
        cell.posterImageView.tag = indexPath.row
        
      
        GestureRecognizer.addTapRecognizer(target: self, action: "showMe:", view: cell.posterImageView)
      
        cell.camera.text = photo.camera
        cell.lens.text = photo.lens
        cell.iso.text = photo.iso
        cell.focalLens.text = photo.focalLength
        cell.shutterSpeed.text = photo.shutterSpeed
        cell.photoActivityIndicator.startAnimating()

        let urlObj = NSURL(string: photo.imageurl!)

        ImageLoader.sharedLoader.imageForUrl(photo.imageurl!, completionHandler:{(image: UIImage?, url: String) in
          cell.posterImageView.image = image
          cell.photoActivityIndicator.stopAnimating()
          //cell.photoActivityIndicator.hidden = true
        })

        return cell
    }
  
    func showMe(sender: UITapGestureRecognizer) {
      println("Click: \(sender.view!.tag)")
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
