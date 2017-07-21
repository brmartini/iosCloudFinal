//
//  TableViewCell.swift
//  iosCloudBruno
//
//  Created by user129281 on 7/20/17.
//  Copyright © 2017 BRMART. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var ivBeer: UIImageView!
    
    @IBOutlet weak var lvName: UILabel!
    
    
    @IBOutlet weak var lvastr: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
