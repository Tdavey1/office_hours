//
//  OfficeHour.swift
//  officeHour
//
//  Created by aitong yu on 2018/4/26.
//  Copyright © 2018 aitong yu. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON


class OfficeHour {
    var time: String!
    var location: String!
    var ta: String!
    
    init(time: String, location: String, ta: String) {
        self.time = time
        self.location = location
        self.ta = ta
    }
    
    init(json: JSON) {
        ta = json["TA"].stringValue
        
        if let loc = json["location"].string {
            self.location = loc
        } else {
            self.location = "N/A"
        }

        time = "\(json["start"].stringValue)-\(json["start"].stringValue)"
    }
}
