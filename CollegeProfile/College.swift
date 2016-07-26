//
//  College.swift
//  CollegeProfile
//
//  Created by Aaron Lichtman on 7/26/16.
//  Copyright © 2016 Aaron Lichtman. All rights reserved.
//

import UIKit

class College: NSObject {
    
    var name = ""
    var state = ""
    var population = 0
    var image = UIImage(named: "Default")
    
    convenience init(name: String, state: String, population: Int, image: UIImage) {
        
        self.init()
        self.name = name
        self.state = state
        self.population = population
        self.image = image
    }
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
