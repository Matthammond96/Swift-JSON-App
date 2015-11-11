
import UIKit
import Foundation
import Alamofire
import SwiftyJSON

class a: UITableViewController {
    
    var locationName = [String]()
    
    //Mark: - UITableDataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationName.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("spotTable", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = locationName[indexPath.row]
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(.GET, "http://woamph.com/savedLocations.json")
        .response { request, response, data, error in
    
            if let data = data {
    
            let json = JSON(data: data)
    
            for locationLoop in json {
            let usersJSON = locationLoop.1["user"].stringValue
            self.locationName.append(usersJSON)
            //let longitudeJSON = locationLoop.1["longitude"].doubleValue
            //self.array2.append(longitudeJSON)
            }
    
            //for i in 0 ..< self.array1.count {
            //print("\(self.array1[i])")
            //print("\(self.array2[i])")
            //self.locationNameLabel.text = "Location Name: \(self.array1[i])"
            //}
    
            //self.titleLabel.text = "Spots Near You"
            //self.locationNameLabel.text = "Location Name: \(spotData.locationName)"
            //self.ratingLabel.text = "Rating: \(spotData.rating)"
            //self.userLabel.text = "Posted By: \(spotData.user)"
            //
            }
        }
    }
}
