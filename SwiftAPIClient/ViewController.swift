//
//  ViewController.swift
//  SwiftAPIClient
//
//  Created by naratti on 2018/12/21.
//  Copyright © 2018 naratti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user: User = User(id: 1, name: "Takumi", age: 20, bio: "自己紹介")
        let encoder = JSONEncoder()
        let encoded = try! encoder.encode(user)
        let json = String(data: encoded, encoding: .utf8)
        
        if let json = json {
            print(json)
        }
        
        let decoder = JSONDecoder()
        let decoded = try? decoder.decode(User.self, from: encoded)
        
        guard let decodedUser = decoded else {
            print("decode error")
            return
        }
        
        print(decodedUser.id)
        print(decodedUser.name)
        print(decodedUser.age)
        print(decodedUser.bio)
    }


}

