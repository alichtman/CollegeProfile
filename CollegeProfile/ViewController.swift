//
//  ViewController.swift
//  CollegeProfile
//
//  Created by Aaron Lichtman on 7/26/16.
//  Copyright © 2016 Aaron Lichtman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tabelView: UITableView!
    
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




}

