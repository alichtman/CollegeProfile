//
//  DetailViewController.swift
//  CollegeProfile
//
//  Created by Aaron Lichtman on 7/26/16.
//  Copyright © 2016 Aaron Lichtman. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var populationTextField: UITextField!
    @IBOutlet weak var urlButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    //------------------------------------------------------
    //There is an ! needed on this line.
    //It makes the compiler happy but I don't understand why?
    //https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-XID_98
    //This should answer my question, but I haven't read it yet.
    //------------------------------------------------------
    var college: College!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collegeTextField.text = college.name
        stateTextField.text = college.state
        populationTextField.text = String(college.population)
        imageView.image = college.image
        urlButton.setTitle(college.url, forState: .Normal)
    }
    
    @IBAction func onPressedSaveButton(sender: AnyObject) {
        
        college.name = collegeTextField.text!
        college.state = stateTextField.text!
        college.population = Int(populationTextField.text!)!
        
        //Pull keyboard
        self.view.endEditing(true)
        }

}
