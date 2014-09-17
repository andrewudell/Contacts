//
//  ContactInput.swift
//  Contacts
//
//  Created by Andrew Udell on 9/16/14.
//  Copyright (c) 2014 Udell. All rights reserved.
//

import UIKit

protocol dataUpdated:NSObjectProtocol {
    func didUpdateContact(senderClass: AnyObject, aName: String, aPhoneNumber: String)
}

class ContactInput: UIViewController, UITextFieldDelegate {

    @IBOutlet var phoneField: UITextField!
    @IBOutlet var nameField: UITextField!
    
    var name = ""
    var phoneNumber = ""
    var delegate: dataUpdated?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.nameField.delegate = self
        self.phoneField.delegate = self
    }
    
    //Textfield delegates
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        if textField.tag == 1 {
            self.name = textField.text
        } else {
            self.phoneNumber = textField.text
        }
        textField.resignFirstResponder()

        println("Name: \(self.name), Phone: \(self.phoneNumber)")
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        if name != "" && phoneNumber != "" {
            self.delegate!.didUpdateContact(self, aName: self.name, aPhoneNumber: self.phoneNumber)
        }
    }
    

}
