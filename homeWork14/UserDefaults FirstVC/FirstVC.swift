//
//  ViewController.swift
//  homeWork14
//
//  Created by Антон Михнюкевич on 07.10.2022.
//

import UIKit

class FirstVC: UIViewController, UITextFieldDelegate {

    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userDefaults.setValue(firstNameTextField.text, forKey: "firstName")
        userDefaults.setValue(lastNameTextField.text, forKey: "lastName")
        firstNameTextField.resignFirstResponder()
        lastNameTextField.resignFirstResponder()
        return true
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        
        if let value = userDefaults.value(forKey: "lastName") as? String {
            lastNameLabel.text = value
        }
        
        if let value = userDefaults.value(forKey: "firstName") as? String {
            firstNameLabel.text = value
        }
    }

}

