//
//  Contacts.swift
//  Contacts
//
//  Created by Andrew Udell on 9/15/14.
//  Copyright (c) 2014 Udell. All rights reserved.
//

import UIKit

class Contacts: UITableViewController, dataUpdated {
    
    // Contact Info Structure
    struct contactInfo {
        var name: String
        var phoneNumber: String
    }
    
    var listOfContacts: [contactInfo] = []
    var firstContact = contactInfo(name: "John Coffey" , phoneNumber: "(111) 111-1111")
    var secondContact = contactInfo(name: "Cathy Kane" , phoneNumber: "(222) 222-2222")
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfContacts.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("contact", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel!.text = listOfContacts[indexPath.row].name
        cell.detailTextLabel!.text = listOfContacts[indexPath.row].phoneNumber
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            listOfContacts.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    override func tableView(tableView: UITableView!, moveRowAtIndexPath sourceIndexPath: NSIndexPath!, toIndexPath destinationIndexPath: NSIndexPath!) {
        
        let fromContact = listOfContacts[sourceIndexPath.row]
        listOfContacts.removeAtIndex(sourceIndexPath.row)
        listOfContacts.insert(fromContact, atIndex: destinationIndexPath.row)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        listOfContacts.append(firstContact)
        listOfContacts.append(secondContact)
    }
    
    //Passing details to detail VC
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if segue.identifier == "ToDetail" {
            
            let indexPath = self.tableView.indexPathForSelectedRow()
            let theSelectedRow = listOfContacts[indexPath!.row]
            let theDestination = (segue.destinationViewController as ContactDetails)
            
            
            theDestination.contactName = theSelectedRow.name
            theDestination.contactPhone = theSelectedRow.phoneNumber
        }
        
        else if segue.identifier == "ToInput" {
            (segue.destinationViewController as ContactInput).delegate = self
        }
    }
    
    func didUpdateContact(senderClass: AnyObject, aName: String, aPhoneNumber: String) {
        
        var newContact = contactInfo(name: aName, phoneNumber: aPhoneNumber)
        listOfContacts.append(newContact)
        
        self.tableView.reloadData()
    }
    
    
    
}
