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
    var DataListArray = [[String: Any]]()
    var saveData : UserDefaults = UserDefaults.standard
    
    //ここでもシングルトンでデータクラスを呼んでいるよ
    let playerData = PlayerData.shared
    
    override func awakeFromNib() {
        DataListArray = saveData.object(forKey: "DataList") as! [[String : Any]]
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func maruButtonTapped(_ sender:UIButton){
        if playerData.number == 1 {
            playerData.aokArray[sender.tag] = playerData.aokArray[sender.tag] + 1
            playerData.angArray[sender.tag] = playerData.angArray[sender.tag] + 1
            playerData.aArray[sender.tag] = playerData.aokArray[sender.tag] / playerData.angArray[sender.tag]
            
            print(playerData.aokArray)
        }else if playerData.number == 2 {
            playerData.bokArray[sender.tag] = playerData.bokArray[sender.tag] + 1
            playerData.bngArray[sender.tag] = playerData.bngArray[sender.tag] + 1
            playerData.bArray[sender.tag] = playerData.bokArray[sender.tag] / playerData.bngArray[sender.tag]

        }else if playerData.number == 3{
            playerData.cokArray[sender.tag] = playerData.cokArray[sender.tag] + 1
            playerData.cngArray[sender.tag] = playerData.cngArray[sender.tag] + 1
            playerData.cArray[sender.tag] = playerData.cokArray[sender.tag] / playerData.cngArray[sender.tag]
        }else if playerData.number == 4{
            playerData.dokArray[sender.tag] = playerData.dokArray[sender.tag] + 1
            playerData.dngArray[sender.tag] = playerData.dngArray[sender.tag] + 1
            playerData.dArray[sender.tag] = playerData.dokArray[sender.tag] / playerData.dngArray[sender.tag]
        }else if playerData.number == 5{
            playerData.eokArray[sender.tag] = playerData.eokArray[sender.tag] + 1
            playerData.engArray[sender.tag] = playerData.engArray[sender.tag] + 1
            playerData.eArray[sender.tag] = playerData.eokArray[sender.tag] / playerData.engArray[sender.tag]
        }
        
//        saveData.set(DataListArray, forKey: "DataList")
    }
    
    @IBAction func batuButtonTapped(_ sender:UIButton){
        if playerData.number == 1 {
            playerData.angArray[sender.tag] = playerData.angArray[sender.tag] + 1
            playerData.aArray[sender.tag] = playerData.aokArray[sender.tag] / playerData.angArray[sender.tag]
        }else if playerData.number == 2 {
            playerData.bngArray[sender.tag] = playerData.bngArray[sender.tag] + 1
            playerData.bArray[sender.tag] = playerData.bokArray[sender.tag] / playerData.bngArray[sender.tag]
        }else if playerData.number == 3{
            playerData.cngArray[sender.tag] = playerData.cngArray[sender.tag] + 1
            playerData.cArray[sender.tag] = playerData.cokArray[sender.tag] / playerData.cngArray[sender.tag]
        }else if playerData.number == 4{
            playerData.dngArray[sender.tag] = playerData.dngArray[sender.tag] + 1
            playerData.dArray[sender.tag] = playerData.dokArray[sender.tag] / playerData.dngArray[sender.tag]
        }else if playerData.number == 5{
            playerData.engArray[sender.tag] = playerData.engArray[sender.tag] + 1
            playerData.eArray[sender.tag] = playerData.eokArray[sender.tag] / playerData.engArray[sender.tag]
        }
//        saveData.set(DataListArray, forKey: "DataList")
    }
}
