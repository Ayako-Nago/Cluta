//
//  InfoViewController.swift
//  Cluta
//
//  Created by Ayako Nago on 2018/11/30.
//  Copyright © 2018年 Ayako Nago. All rights reserved.
//

import UIKit



class InfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var number: Int!
    let segueNumber: UserDefaults = UserDefaults.standard
    var row: Int!
    
    
    
    @IBOutlet weak var tableView: UITableView!
    var DataListArray = [[String: Any]]()
    var saveData : UserDefaults = UserDefaults.standard
    var aArray = [[String: Any]]()
    var bArray = [[String: Any]]()
    var cArray = [[String: Any]]()
    var dArray = [[String: Any]]()
    var eArray = [[String: Any]]()
    let playerData = PlayerData.shared
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let DataCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath)
//        DataCell.textLabel!.text = DataListArray[indexPath.row]["name"] as? String
        if playerData.number == 1{
            DataCell.textLabel!.text = aArray[indexPath.row]["name"] as? String
        }else if playerData.number == 2{
            DataCell.textLabel!.text = bArray[indexPath.row]["name"] as? String
        }else if playerData.number == 3{
            DataCell.textLabel!.text = cArray[indexPath.row]["name"] as? String
        }else if playerData.number == 4{
            DataCell.textLabel!.text = dArray[indexPath.row]["name"] as? String
        }else if playerData.number == 5{
            DataCell.textLabel!.text = eArray[indexPath.row]["name"] as? String
        }
        row = indexPath.row
        
        return DataCell
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        if UserDefaults.standard.object(forKey: "DataList") != nil {
            DataListArray = saveData.object(forKey: "DataList") as! [[String: Any]]
        }
        print(DataListArray)
        aArray = DataListArray
        bArray = DataListArray
        cArray = DataListArray
        dArray = DataListArray
        eArray = DataListArray
        aArray.sort{
            (($0 as Dictionary<String, Any>)["a"] as! Int) < (($1 as Dictionary<String, Any>)["a"] as! Int)
        }
        bArray.sort{
            (($0 as Dictionary<String, Any>)["b"] as! Int) < (($1 as Dictionary<String, Any>)["b"] as! Int)
        }
        cArray.sort{
            (($0 as Dictionary<String, Any>)["c"] as! Int) < (($1 as Dictionary<String, Any>)["c"] as! Int)
        }
        dArray.sort{
            (($0 as Dictionary<String, Any>)["d"] as! Int) < (($1 as Dictionary<String, Any>)["d"] as! Int)
        }
        eArray.sort{
            (($0 as Dictionary<String, Any>)["e"] as! Int) < (($1 as Dictionary<String, Any>)["e"] as! Int)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let chartViewController = segue.destination as! ChartViewController
        
        chartViewController.index = row 
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataListArray.count
    }
}

