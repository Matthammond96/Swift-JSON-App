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

    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var findOnMap: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(manger: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let newLocation = locations.last
        
        if let newLocation = newLocation {
            print("Location Cord: \(newLocation)")
            
            Alamofire.request(.GET, "http://woamph.com/test.json")
                .response { request, response, data, error in
                    
                if let data = data {
                        
                    let json = JSON(data: data)
                    let spotData = Spots(json: json)
                
                    self.titleLabel.text = "Spots Near You"
                    self.locationNameLabel.text = "Location Name: \(spotData.locationName)"
                    self.ratingLabel.text = "Rating: \(spotData.rating)"
                    self.userLabel.text = "Posted By: \(spotData.user)"
                    
                    
                }
            }
        }
    }
}

