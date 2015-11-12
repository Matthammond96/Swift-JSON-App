
import UIKit
import Foundation
import Alamofire
import SwiftyJSON

class SpotsDataClass: UITableViewController {
    
    
    @IBOutlet weak var longitudeLabel: UILabel!
    
    var locationName = [String]()
    var longitudeLabelArray = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(.GET, "http://woamph.com/savedLocations.json")
            .response { request, response, data, error in
                
                if let data = data {
                    
                    let json = JSON(data: data)
                    
                    for locationLoop in json {
                        let usersJSON = locationLoop.1["user"].stringValue
                        self.locationName.append(usersJSON)
                        let longitudeJSON = locationLoop.1["longitude"].doubleValue
                        self.longitudeLabelArray.append(longitudeJSON)
                        self.tableView.reloadData()
                    }
                    
                    for i in 0 ..< self.locationName.count {
                        print("\(self.locationName[i])")
                        print("\(self.longitudeLabelArray[i])")
                        //self.locationNameLabel.text = "Location Name: \(self.array1[i])"
                    }
                    
                    //self.titleLabel.text = "Spots Near You"
                    //self.locationNameLabel.text = "Location Name: \(spotData.locationName)"
                    //self.ratingLabel.text = "Rating: \(spotData.rating)"
                    //self.userLabel.text = "Posted By: \(spotData.user)"
                    //
                }
        }
    }
    
    //Mark: - UITableDataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationName.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("spotTable", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = locationName[indexPath.row]
        
        return cell
    }
}