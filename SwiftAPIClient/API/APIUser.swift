//
//  User.swift
//  SwiftAPIClient
//
//  Created by naratti on 2018/12/22.
//  Copyright © 2018 naratti. All rights reserved.
//

import Foundation
import Alamofire

extension API {
    func showAllUser(_ callback: @escaping (_: DefaultDataResponse) -> ()) {
        GET("users/") { response in
            callback(response)
        }
    }
    
    func showUser(id: Int, _ callback: @escaping (_: DefaultDataResponse) -> ()) {
        GET("users/\(id)") { response in
            callback(response)
        }
    }
    
    func createUser(parameters: [String: Any], _ callback: @escaping (_: DefaultDataResponse) -> ()) {
        POST("users/", parameters: parameters) { response in
            callback(response)
        }
    }
}
