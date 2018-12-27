//
//  ViewController.swift
//  SwiftAPIClient
//
//  Created by naratti on 2018/12/21.
//  Copyright © 2018 naratti. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var userList = [User]()
    var selectedUser: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchUser()
    }
    
    func fetchUser() {
        userList = []
        
        API().showAllUser { (response) in
            if let data = response.data {
                do {
                    let decode: [User] = try JSONDecoder().decode([User].self, from: data)
                    
                    if let users: [User] = decode {
                        for user in users {
                            self.userList.append(user)
                        }
                    }
                    
                    self.tableView.reloadData()
                } catch {
                    print("デコードに失敗しました")
                }
            }
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let userName = userList[indexPath.row].name
        
        cell.textLabel?.text = userName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedUser = userList[indexPath.row]
        
        performSegue(withIdentifier: "UserDetailViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("CCC")
        print(segue.identifier)
        if segue.identifier == "UserDetailViewController" {
            let viewController = (segue.destination as? UserDetailViewController)
            
            viewController?.user = selectedUser
        }
    }
    
    @IBAction func reloadData(_ segue: UIStoryboardSegue) {
        fetchUser()
    }


}

