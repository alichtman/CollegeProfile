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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colleges.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = colleges[indexPath.row]
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }




}

