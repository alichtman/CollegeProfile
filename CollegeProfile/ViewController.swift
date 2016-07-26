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
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    //Initialize a new array of type college
    var colleges: [College] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Toggle editing on???
        editButton.tag = 0
        
        //Adding sample College
        
        //ERROR:
        //I'm getting an EXC BAD INSTRUCTION error which normally has to do with some implicitly unwrapped optional property (according to Stack Overflow). I've played around with placement of the ! and Xcode won't compile unless the ! is there. I've tried swapping it with a ?, and Xcode doesn't like that.
        
        
        colleges.append(College(name: "UCSD", state: "California", population: 32000, image: (UIImage(named: "UCSD"))))
        
    }
    
    //Set up tableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colleges.count
    }
    
    //Set up tableView

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = colleges[indexPath.row].name
        
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
            self.colleges.append(College(name: collegeTextField.text!))
            self.tableView.reloadData()
        }
    
        alert.addAction(addAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    //Allow reordering of entries
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    //Reordering things
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(college, atIndex: destinationIndexPath.row)
    }
    
    //Enable editing
    @IBAction func onButtonPressEdit(sender: UIBarButtonItem) {
        
        if editButton.tag == 0{
            tableView.editing = true
            sender.tag = 1
        }
        else {
            tableView.editing = false
            sender.tag = 0
        }
    }
    
    //Segue and data transfer
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! DetailViewController
        let index = tableView.indexPathForSelectedRow?.row
        dvc.college = colleges[index!]
    }
    
}