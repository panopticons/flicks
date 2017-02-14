//
//  MovieCell.swift
//  flicks
//
//  Created by fer on 2/2/17.
//  Copyright © 2017 fer. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var movieCTitle: UILabel!
    
    @IBOutlet weak var movieCPoster: UIImageView!
    
    @IBOutlet weak var movieCOverview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
