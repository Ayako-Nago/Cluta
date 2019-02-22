//
//  ChartViewController.swift
//  Cluta
//
//  Created by Ayako Nago on 2018/12/07.
//  Copyright © 2018年 Ayako Nago. All rights reserved.
//

import UIKit

class ChartViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var DataListArray = [[String: Any]]()
    var saveData : UserDefaults = UserDefaults.standard
    let playerData = PlayerData.shared
    let skillArray = ["A","B","C","D","E"]
    var index : Int!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let DataCell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath) as! InfoCell
        DataCell.textLabel!.text = skillArray[indexPath.row]
        DataCell.all.text = ""
        return DataCell
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        if UserDefaults.standard.object(forKey: "DataList") != nil {
            DataListArray = saveData.object(forKey: "DataList") as! [[String: Any]]
        }
    }
    
}
