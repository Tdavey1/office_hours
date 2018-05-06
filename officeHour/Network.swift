//
//  Network.swift
//  officeHour
//
//  Created by aitong yu on 2018/5/3.
//  Copyright © 2018 aitong yu. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire


//Network.getAllCourses { courses in
//
//}

class Network {
    private static let endpoint = "http://35.190.171.82/api/v0/"
    
    static func getCourses(withQuery query: String, _ completion: @escaping ([Class]) -> Void) {
        guard let coursesUrl = URL(string: endpoint + "courses?text=\(query)") else { return }
        var classes: [Class] = []
        Alamofire.request(coursesUrl).validate().responseJSON { response in
            switch response.result {
            case .success(let data):
                //
                let json = JSON(data)
                for courseJSON in json["data"].arrayValue {
                    let course = Class(json: courseJSON)
                    classes.append(course)
                }
                completion(classes)
                
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    static func getOHs(id: Int, _completion: @escaping([OfficeHour])->Void) {
        //guard let coursesUrl = URL(string: endpoint + "oh?id=\(id)$time=2018-5-3_1:10PM") else { return }
        guard let coursesUrl = URL(string: "http://35.190.171.82/api/v0/oh?id=\(id)"+"&time=2018-5-3_1:10PM") else { return }

        var officeHours: [OfficeHour] = []
        Alamofire.request(coursesUrl).validate().responseJSON { response in
            switch response.result {
            case .success(let data):
                //
                let json = JSON(data)
                for ohJSON in json["data"].arrayValue {
                    let oh = OfficeHour(json: ohJSON)
                    print(oh.ta)
                    officeHours.append(oh)
                    print(officeHours)
                }
                _completion(officeHours)
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    
    
   // static func getClasses(withQuery query: String, _completion: @escaping([Class])->Void){
     //   let parameters =  ["id": query, "oh":""]
//
//        Alamofire.request(endpoint,parameters:parameters).validate().responseJSON { (response) in
//
//            switch response.result {
//
//            case .success(let json):
//
//                let json = JSON(json)
//                var course: [Class] = []
//
//                for classJSON in json["results"].arrayValue {
//                    course.append(Class(from: classJSON, instructor: <#String#>))
//                }
//
//                completion(course)
//
//            case .failure(let error):
//                print("[Network] Error:", error)
//                completion([])
//
//            }
        
//        }
//
//
//    }
//
//}

}

        

