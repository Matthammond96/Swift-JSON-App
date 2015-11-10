
import Foundation
import SwiftyJSON

class Spots {
    
    //MetaData
    let placeLocationName: String!
    let description: String!
    let rating: Double!
    let user: String!
    
    //LocationData
    let longitude: Double!
    let latitude: Double!
    let locationName: String!
    
    
    init(json: JSON) {
    
        //MetaData
        placeLocationName = json["metaData"]["placeLocationName"].stringValue
        description = json["metaData"]["description"].stringValue
        rating = json["metaData"]["rating"].doubleValue
        user = json["metaData"]["user"].stringValue
        
        //LocationData
        longitude = json["locationData"]["longitude"].doubleValue
        latitude = json["locationData"]["latitude"].doubleValue
        locationName = json["locationData"]["locationName"].stringValue
        
    }
}
