//
//  ContactDetails.swift
//  Contacts
//
//  Created by Andrew Udell on 9/15/14.
//  Copyright (c) 2014 Udell. All rights reserved.
//

import UIKit

class ContactDetails: UIViewController {
    
    
    @IBOutlet var contactNameLabel: UILabel!
    @IBOutlet var contactPhoneLabel: UILabel!
    
    var contactName = ""
    var contactPhone = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        contactNameLabel.text = contactName
        contactPhoneLabel.text = contactPhone
    }

}
