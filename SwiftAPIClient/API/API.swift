//
//  API.swift
//  SwiftAPIClient
//
//  Created by naratti on 2018/12/22.
//  Copyright © 2018 naratti. All rights reserved.
//

import Foundation
import Alamofire

// let url: String = "http://192.168.1.7:3000/"
let url: String = "http://127.0.0.1:3000/"
let headers: HTTPHeaders = [
    "Contenttype": "application/json"
] // TODO: Add access token

struct API {
    
    func GET(_ endpoint: String, _ callback: @escaping (_: DefaultDataResponse) -> ()) {
        Alamofire.request(fullPath(endpoint), method: .get, headers: headers).response {  response in
            callback(response)
        }
    }
    
    func POST(_ endpoint: String, parameters: [String: Any], _ callback: @escaping (_: DefaultDataResponse) -> ()) {
        Alamofire.request(fullPath(endpoint), method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).response { response in
            callback(response)
        }
    }
    
    private func fullPath(_ endpoint: String) -> String {
        return url + endpoint
    }
}
