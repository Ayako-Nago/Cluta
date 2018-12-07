//
//  InfoViewController.swift
//  Cluta
//
//  Created by Ayako Nago on 2018/11/30.
//  Copyright © 2018年 Ayako Nago. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let DataCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath)
  //      let DataCell = tableView.dequeueReusableCell(withIdentifier: "DataCell")
        DataCell.textLabel!.text = DataListArray[indexPath.row]
  //      DataCell?.textLabel?.text = "test"
        return DataCell
    }
    
    
    var DataListArray = [String]()
    
    var saveData : UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {


        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        print("Did")
        
        if UserDefaults.standard.object(forKey: "DataList") != nil {
            DataListArray = saveData.object(forKey: "DataList") as! [String]
        }
        print(DataListArray)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataListArray.count

    }
    
    
}
