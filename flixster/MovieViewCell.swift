//
//  MovieViewCell.swift
//  flixster
//
//  Created by Paul Newling on 2/13/21.
//  Copyright © 2021 Paul Newling. All rights reserved.
//

import UIKit

class MovieViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sysnopsisLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
