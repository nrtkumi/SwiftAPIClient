//
//  User.swift
//  SwiftAPIClient
//
//  Created by naratti on 2018/12/21.
//  Copyright © 2018 naratti. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let age: Int
    let bio: String?
}
