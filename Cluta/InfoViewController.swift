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
    @IBOutlet weak var tableView: UITableView!
    var DataListArray = [[String: Any]]()
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let DataCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath)
        DataCell.textLabel!.text = DataListArray[indexPath.row]["name"] as? String
  
        return DataCell
    }
    
    var saveData : UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {


        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        print("Did")
        
        if UserDefaults.standard.object(forKey: "DataList") != nil {
            DataListArray = saveData.object(forKey: "DataList") as! [[String: Any]]
        }
        print(DataListArray)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataListArray.count

    }
    
    
}
