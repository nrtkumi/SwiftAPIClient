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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(user!.name)
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
