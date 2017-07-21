//
//  Punk.swift
//  iosCloudBruno
//
//  Created by user129281 on 7/20/17.
//  Copyright © 2017 BRMART. All rights reserved.
//

import Foundation
class Punk {
    
    var name: String
    var image_url: String
    var tagline: String
    var abv: Double
    var ibu: String
    var description: String
    
    init (_ name: String, _ image_url: String, _ tagline: String, _ abv: Double, _ ibu: String, _ description: String) {
        self.name = name
        self.image_url = image_url
        self.tagline = tagline
        self.abv = abv
        self.ibu = ibu
        self.description = description
    }
    
    
    
    
}
