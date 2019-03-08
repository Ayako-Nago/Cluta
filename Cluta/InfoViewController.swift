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
    var way: Int!
    
    
    @IBOutlet weak var tableView: UITableView!{
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
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
            (($0 as Dictionary<String, Any>)["A"] as! Int) < (($1 as Dictionary<String, Any>)["A"] as! Int)
        }
        bArray.sort{
            (($0 as Dictionary<String, Any>)["B"] as! Int) < (($1 as Dictionary<String, Any>)["B"] as! Int)
        }
        cArray.sort{
            (($0 as Dictionary<String, Any>)["C"] as! Int) < (($1 as Dictionary<String, Any>)["C"] as! Int)
        }
        dArray.sort{
            (($0 as Dictionary<String, Any>)["D"] as! Int) < (($1 as Dictionary<String, Any>)["D"] as! Int)
        }
        eArray.sort{
            (($0 as Dictionary<String, Any>)["E"] as! Int) < (($1 as Dictionary<String, Any>)["E"] as! Int)
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataListArray.count
    }
    
    //ここで画面遷移のコードを書いている
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if playerData.number == 1{
            way = aArray[indexPath.row]["n"] as? Int
            print(way ,"aArray")
        }else if playerData.number == 2{
            way = bArray[indexPath.row]["n"] as? Int
        }else if playerData.number == 3{
            way = cArray[indexPath.row]["n"] as? Int
        }else if playerData.number == 4{
            way = dArray[indexPath.row]["n"] as? Int
        }else if playerData.number == 5{
            way = eArray[indexPath.row]["n"] as? Int
        }
//        ChartViewController.way = way as! Int
        print(indexPath.row)
         self.performSegue(withIdentifier: "toChart", sender: way)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let chartViewController = segue.destination as! ChartViewController
        print(way, "prepare")
        chartViewController.way = way
        //        let arrayNumber = sender as! Int
        //        print(aArray[arrayNumber])
        //        chartViewController.independent =
    }
    
}

