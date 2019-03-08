//
//  InputDataViewController.swift
//  Cluta
//
//  Created by Ayako Nago on 2018/11/30.
//  Copyright © 2018年 Ayako Nago. All rights reserved.
//

import UIKit

class InputDataViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataListArray.count
    }
    
    var DataListArray = [[String :Any]]()
    var saveData : UserDefaults = UserDefaults.standard
    let playerData = PlayerData.shared
    var i: Int=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("number", playerData.number)
        tableView.delegate = self
        tableView.dataSource = self
        
        
        if UserDefaults.standard.object(forKey: "DataList") != nil {
            DataListArray = saveData.object(forKey: "DataList") as! [[String: Any]]
        }
        playerData.aokArray = DataListArray.map{$0["Aok"] as? Int ?? 0}
        playerData.angArray = DataListArray.map{$0["Ang"] as? Int ?? 0}
        playerData.bokArray = DataListArray.map{$0["Bok"] as? Int ?? 0}
        playerData.bngArray = DataListArray.map{$0["Bng"] as? Int ?? 0}
        playerData.cokArray = DataListArray.map{$0["Cok"] as? Int ?? 0}
        playerData.cngArray = DataListArray.map{$0["Cng"] as? Int ?? 0}
        playerData.dokArray = DataListArray.map{$0["Dok"] as? Int ?? 0}
        playerData.dngArray = DataListArray.map{$0["Dng"] as? Int ?? 0}
        playerData.eokArray = DataListArray.map{$0["Eok"] as? Int ?? 0}
        playerData.engArray = DataListArray.map{$0["Eng"] as? Int ?? 0}
        playerData.aArray = DataListArray.map{$0["A"] as? Int ?? 0}
        playerData.bArray = DataListArray.map{$0["B"] as? Int ?? 0}
        playerData.cArray = DataListArray.map{$0["C"] as? Int ?? 0}
        playerData.dArray = DataListArray.map{$0["D"] as? Int ?? 0}
        playerData.eArray = DataListArray.map{$0["E"] as? Int ?? 0}
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell") as! CustomCell
        cell.textLabel!.text = DataListArray[indexPath.row]["name"] as? String
        cell.maruButton.tag = indexPath.row
        cell.batuButton.tag = indexPath.row
        return cell
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //DataListArrayを更新
        DataListArray = saveData.object(forKey: "DataList") as! [[String: Any]]
        //for文を使って、番号を指定、要素を指定、そこの中に、playerData.~Arrayの要素を代入する
        for i in 0...DataListArray.count-1{
            print(i)
            DataListArray[i]["Aok"] = playerData.aokArray[i]
            DataListArray[i]["Ang"] = playerData.angArray[i]
            DataListArray[i]["A"] = playerData.aArray[i]
            DataListArray[i]["Bok"] = playerData.bokArray[i]
            DataListArray[i]["Bng"] = playerData.bngArray[i]
            DataListArray[i]["B"] = playerData.bArray[i]
            DataListArray[i]["Cok"] = playerData.cokArray[i]
            DataListArray[i]["Cng"] = playerData.cngArray[i]
            DataListArray[i]["C"] = playerData.cArray[i]
            DataListArray[i]["Dok"] = playerData.dokArray[i]
            DataListArray[i]["Dng"] = playerData.dngArray[i]
            DataListArray[i]["D"] = playerData.dArray[i]
            DataListArray[i]["Eok"] = playerData.eokArray[i]
            DataListArray[i]["Eng"] = playerData.engArray[i]
            DataListArray[i]["E"] = playerData.eArray[i]
        }
        //userDefaultに保存
        saveData.set(DataListArray,forKey:"DataList" )
    }
}
