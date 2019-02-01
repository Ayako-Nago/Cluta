//
//  CustomCell.swift
//  Cluta
//
//  Created by Ayako Nago on 2019/02/01.
//  Copyright © 2019年 Ayako Nago. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var maruButton:UIButton!
    
    @IBOutlet weak var batuButton:UIButton!
    var inPutDataViewController: InputDataViewController? = InputDataViewController()
    //weak消したら動いた
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func maruButtonTapped(_ sender:UIButton){
        print("c", sender.tag)
        inPutDataViewController?.maruButtonPressed(rowNumber: sender.tag)
    }
    
    @IBAction func batuButtonTapped(_ sender:UIButton){
        print("d", sender.tag)
        inPutDataViewController?.batuButtonPressed(retuNumber: sender.tag)
    }

}
