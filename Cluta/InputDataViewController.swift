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
        playerData.aArray = DataListArray.map{$0["a"] as? Int ?? 0}
        playerData.bArray = DataListArray.map{$0["b"] as? Int ?? 0}
        playerData.cArray = DataListArray.map{$0["c"] as? Int ?? 0}
        playerData.dArray = DataListArray.map{$0["d"] as? Int ?? 0}
        playerData.eArray = DataListArray.map{$0["e"] as? Int ?? 0}
        
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
        //for文を使って、番号を指定、要素を指定、そこの中に、playerData.~Arrayの要素を代入する
        
        //userDefaultに保存
    }
}
