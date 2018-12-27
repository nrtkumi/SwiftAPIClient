//
//  UserFormViewController.swift
//  SwiftAPIClient
//
//  Created by naratti on 2018/12/25.
//  Copyright © 2018 naratti. All rights reserved.
//

import UIKit

class UserFormViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var bioField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapCreateUserButton(_ sender: Any) {
        guard let name = nameField.text, let age = ageField.text else {
            print("名前か年齢がnil")
            return
        }
        
        if name != "" && age != "" {
            let bio = bioField.text
            let parameters: [String: Any] = [ "name": name, "age": Int(age), "bio": bio ]
            
            API().createUser(parameters: parameters) { (response) in
                guard let res = response.response else {
                    print("nil response")
                    return
                }
                
                // print(res.statusCode)
                
                if res.statusCode == 201 {
                    // created
                    self.performSegue(withIdentifier: "reloadData", sender: nil)
                }
            }
        } else {
            print("名前か年齢が空文字")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
 
}
