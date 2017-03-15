//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by Gina Ratto on 2/23/17.
//  Copyright © 2017 Gina Ratto. All rights reserved.
//

import UIKit
import Parse

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
