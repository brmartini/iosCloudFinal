//
//  ViewController.swift
//  iosCloudBruno
//
//  Created by user129281 on 7/20/17.
//  Copyright © 2017 BRMART. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lvName: UILabel!
    
    @IBOutlet weak var lvadv: UILabel!
    
    @IBOutlet weak var lvdescrip: UILabel!
    
    
    @IBOutlet weak var lvastr: UILabel!
    
    @IBOutlet weak var lvam: UILabel!
    @IBOutlet weak var ivBeer: UIImageView!
    
    
    var beer: Punk!
    var beerImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lvName.text = beer.name
        ivBeer.image = beerImage
        lvdescrip.text = beer.description
        lvastr.text = "\(beer.abv)"
        lvam.text = beer.ibu
        lvadv.text = beer.tagline
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

