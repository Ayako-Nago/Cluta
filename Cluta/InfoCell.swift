//
//  InfoCell.swift
//  Cluta
//
//  Created by Ayako Nago on 2019/02/15.
//  Copyright © 2019年 Ayako Nago. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {

    @IBOutlet var all: UILabel!
    @IBOutlet var clear: UILabel!
    let playerData = PlayerData.shared
    let skillArray = ["A","B","C","D","E"]
    @IBOutlet var name: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
