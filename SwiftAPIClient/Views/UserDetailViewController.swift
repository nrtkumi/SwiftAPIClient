//
//  UserDetailViewController.swift
//  SwiftAPIClient
//
//  Created by naratti on 2018/12/25.
//  Copyright © 2018 naratti. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    var user: User?
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let user = user else {
            print("nil user")
            return
        }
        
        idLabel.text = String(user.id)
        nameLabel.text = user.name
        ageLabel.text = String(user.age)
        bioLabel.text = user.bio
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
