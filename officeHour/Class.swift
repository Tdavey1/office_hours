//
//  Class.swift
//  officeHour
//
//  Created by aitong yu on 2018/4/25.
//  Copyright © 2018 aitong yu. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class Class {
    var classId: Int
    var instructor: String
    var className: String
    var classNum: String
    var officeHour: [OfficeHour] = []
    
    init(classId: Int, instructor: String, className:String, officeHour:[OfficeHour], classNum:String) {
        self.classId = classId
        self.instructor = instructor
        self.className = className
        self.officeHour = officeHour
        self.classNum = classNum
    }
    
    init(json: JSON) {
        classId = json["id"].intValue
        instructor = json["instructor"].stringValue
        className = json["course_name"].stringValue
        classNum = json["course_num"].stringValue
    }
}
