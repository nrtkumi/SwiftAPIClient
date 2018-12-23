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
        
        // testUser()
        // showUser()
        // createUser()
        
        print("Hello!")
    }
    
    func showAllUser() {
        API().showAllUser { response in
            if let data = response.data {
                let decode: [User] = try! JSONDecoder().decode([User].self, from: data)
                
                if let users: [User] = decode {
                    for user in users {
                        print(user.id)
                        print(user.name)
                        print(user.age)
                        print(user.bio)
                    }
                }
            }
        }
    }
    
    func createUser() {
        let parameters: [String: Any] = [
            "name": "NARA",
            "age": 20,
            "bio": "test test test test test"
        ]
        
        API().createUser(parameters: parameters) { response in
            // decode
            if let data = response.data {
                let decode = try? JSONDecoder().decode(User.self, from: data)
                
                if let user = decode {
                    print(user.id)
                    print(user.name)
                    print(user.age)
                    print(user.bio)
                }
            }
        }
    }
    
    func showUser() {
        API().showUser(id: 1) { response in
            print("callback!!!")
            print(response.response?.statusCode)
        }
    }
    
    func testUser() {
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

