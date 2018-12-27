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

        // Do any additional setup after loading the view.
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
                
                print(res.statusCode)
                
                if res.statusCode == 201 {
                    print("OK")
                    self.performSegue(withIdentifier: "reloadData", sender: nil)
                    //self.navigationController?.popViewController(animated: true)
                    //self.performSegue(withIdentifier: "createSuccessful", sender: nil)
                    print("VVVVVVVVVVV")
                }
            }
        } else {
            print("名前か年齢が空文字")
            
            //self.dismiss(animated: true, completion: nil)
            // self.navigationController?.popViewController(animated: true)
            // performSegue(withIdentifier: "reloadData", sender: nil)

        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toForm" {
            let vc = (segue.destination as? ViewController)
            print("Success create user!")
        }
    }*/
    
    //@IBAction func successCreate(segue: UIStoryboardSegue) {
        
    //}
 
}
