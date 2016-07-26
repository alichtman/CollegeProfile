//
//  DetailViewController.swift
//  CollegeProfile
//
//  Created by Aaron Lichtman on 7/26/16.
//  Copyright © 2016 Aaron Lichtman. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var populationTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    //------------------------------------------------------
    //There is an ! needed on this line.
    //It makes the compiler happy but I don't understand why?
    //https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-XID_98
    //This should answer my question, but I haven't read it yet.
    //------------------------------------------------------
    var college: College!
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        
        collegeTextField.text = college.name
        stateTextField.text = college.state
        populationTextField.text = String(college.population)
        imageView.image = college.image
        urlTextField.text = college.url
    }
    
    //Allow embedded safari page
    @IBAction func onPressedSafariButton(sender: UIButton) {
        let url = NSURL(string: urlTextField.text!)!
        UIApplication.sharedApplication().openURL(url)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        imagePicker.dismissViewControllerAnimated(true){
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.imageView.image = selectedImage
        }
    }
    
    //Allow image embedding from gallery
    @IBAction func onButtonPressGallery(sender: UIButton) {
        self.imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(self.imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func onPressedSaveButton(sender: AnyObject) {
        
        college.name = collegeTextField.text!
        college.state = stateTextField.text!
        college.population = Int(populationTextField.text!)!
        college.url = urlTextField.text!
        college.image = imageView.image!
        
        //Pull keyboard
        self.view.endEditing(true)
    }
    
}
