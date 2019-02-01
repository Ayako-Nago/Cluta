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
    var number: Int!
    var all: Int =  0
    var clear: Int = 0
    var aokArray = [Int]()
    var angArray = [Int]()
    var bokArray = [Int]()
    var bngArray = [Int]()
    var cokArray = [Int]()
    var cngArray = [Int]()
    var dokArray = [Int]()
    var dngArray = [Int]()
    var eokArray = [Int]()
    var engArray = [Int]()
    var DataListArray = [[String :Any]]()
    var saveData : UserDefaults = UserDefaults.standard
    var number10: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("number", number)
        tableView.delegate = self
        tableView.dataSource = self
        
        if UserDefaults.standard.object(forKey: "DataList") != nil {
            DataListArray = saveData.object(forKey: "DataList") as! [[String: Any]]
        }
        aokArray = DataListArray.map{$0["Aok"] as? Int ?? 0}
        angArray = DataListArray.map{$0["Ang"] as? Int ?? 0}
        bokArray = DataListArray.map{$0["Bok"]as! Int}
        bngArray = DataListArray.map{$0["Bng"]as! Int}
        cokArray = DataListArray.map{$0["Cok"]as! Int}
        cngArray = DataListArray.map{$0["Cng"]as! Int}
        dokArray = DataListArray.map{$0["Dok"]as! Int}
        dngArray = DataListArray.map{$0["Dng"]as! Int}
        eokArray = DataListArray.map{$0["Eok"]as! Int}
        engArray = DataListArray.map{$0["Eng"]as! Int}
        
        number10 = number
        
        print("number10", number10)
    
//        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "DataCell")
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell") as! CustomCell
        cell.textLabel!.text = DataListArray[indexPath.row]["name"] as? String
        cell.maruButton.tag = indexPath.row
        cell.batuButton.tag = indexPath.row
        return cell
    }
    
    
    func maruButtonPressed(rowNumber: Int) {
        print("丸が押された")
        print("number10", number10)
        if number == 1 {
            aokArray[rowNumber] = aokArray[rowNumber] + 1
            angArray[rowNumber] = angArray[rowNumber] + 1
            print("a", aokArray[rowNumber])
            print("b", angArray[rowNumber])
        }else if number == 2 {
            bokArray[rowNumber] = bokArray[rowNumber] + 1
            bngArray[rowNumber] = bngArray[rowNumber] + 1
            print(bokArray[rowNumber])
            print(bngArray[rowNumber])
        }else if number == 3{
            cokArray[rowNumber] = cokArray[rowNumber] + 1
            cngArray[rowNumber] = cngArray[rowNumber] + 1
            print(cokArray[rowNumber])
            print(cngArray[rowNumber])
        }else if number == 4{
            dokArray[rowNumber] = dokArray[rowNumber] + 1
            dngArray[rowNumber] = dngArray[rowNumber] + 1
            print(dokArray[rowNumber])
            print(dngArray[rowNumber])
        }else if number == 5{
            eokArray[rowNumber] = eokArray[rowNumber] + 1
            engArray[rowNumber] = engArray[rowNumber] + 1
            print(eokArray[rowNumber])
            print(engArray[rowNumber])
        }
    }
    func batuButtonPressed(retuNumber: Int) {
        if number == 1 {
            angArray[retuNumber] = angArray[retuNumber] + 1
            print(angArray[retuNumber])
        }else if number == 2 {
            bngArray[retuNumber] = bngArray[retuNumber] + 1
            print(bngArray[retuNumber])
        }else if number == 3{
            cngArray[retuNumber] = cngArray[retuNumber] + 1
            print(cngArray[retuNumber])
        }else if number == 4{
            dngArray[retuNumber] = dngArray[retuNumber] + 1
            print(dngArray[retuNumber])
        }else if number == 5{
            engArray[retuNumber] = engArray[retuNumber] + 1
            print(engArray[retuNumber])
        }
    }
}
