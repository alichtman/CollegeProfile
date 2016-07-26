//
//  ViewController.swift
//  CollegeProfile
//
//  Created by Aaron Lichtman on 7/26/16.
//  Copyright © 2016 Aaron Lichtman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var colleges = ["Princeton", "UCLA", "UIC", "Harvard"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Set up tableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colleges.count
    }
    
    //Set up tableView

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = colleges[indexPath.row]
        
        return cell
    }
    
    //Allow entries to be deleted
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            colleges.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }

    //Allow entries to be added and then allow cancellation of addition
    @IBAction func onButtonPressAdd(sender: UIBarButtonItem) {
        
        //Alert for creation of new entry
        let alert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Add College Here"
        }
        //Allowing cancellation of new entry
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancelAction)
        
        
        
        //Creation of new entry
        let addAction = UIAlertAction(title: "Add", style: .Default) { (action) in
            
            let collegeTextField = alert.textFields![0] as UITextField
            self.colleges.append(collegeTextField.text!)
            self.tableView.reloadData()
        }
    
        alert.addAction(addAction)
        self.presentViewController(alert, animated: true, completion: nil)
}

}
