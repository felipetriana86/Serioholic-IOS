//
//  MovieAPI.swift
//  Serioholic
//
//  Created by english on 2023-03-30.
//
import Foundation
import UIKit

class MovieAPI {
    
    static let baseURL = "https://unogs-unogs-v1.p.rapidapi.com/"
    static func currentListSeries(limit : Int,
                                  successHandler: @escaping (_ httpStatusCode : Int, _ response : [String: Any]) -> Void,
                                  failHandler : @escaping (_ httpStatusCode : Int, _ errorMessage: String) -> Void) {
        
        let endPoint = "search/titles?limit=\(limit)"
        let header = ["X-RapidAPI-Key": "83c0839c7amshcc8203e1e664408p1dab21jsn6b05fda3d323",
                      "X-RapidAPI-Host": "unogs-unogs-v1.p.rapidapi.com"]
        let payload : [String:String] = [:]
        
        API.call(baseURL: baseURL, endPoint: endPoint, method: "GET", header: header, payload: payload, successHandler: successHandler, failHandler: failHandler)
    }
}

struct Series : Codable {
    var img : String
    var title : String
    var title_type : String
    var synopsis : String
    var rating : String
    var year : String
    var poster : String
    
    static func decode( json : [String:Any] ) -> Series? {
        
        let decoder = JSONDecoder()
        do{
            let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            let series = try decoder.decode(Series.self, from: data)
            return series
        } catch {
        }
        return nil
    }
}





