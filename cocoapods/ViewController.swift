//
//  ViewController.swift
//  cocoapods
//
//  Created by apple on 09/11/2015.
//  Copyright © 2015 apple. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    let locationManager = CLLocationManager()
    var array1 = [String]()
    var array2 = [Double]()
    var items: [String] = ["We", "Heart", "Swift"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
    }
    
}

extension ViewController: CLLocationManagerDelegate {
    
  //  func locationManager(manger: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    //    let newLocation = locations.last
        
      //  if let newLocation = newLocation {
            //print("Location Cord: \(newLocation)")
      //  }
   // }
}

