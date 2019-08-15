//
//  SongInfoTableViewCell.swift
//  SongsTableViewSearchBar
//
//  Created by Kary Martinez on 8/15/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class SongInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var Song: UILabel!
    @IBOutlet weak var Artist: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
