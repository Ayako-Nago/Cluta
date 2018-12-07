//
//  InputDataViewController.swift
//  Cluta
//
//  Created by Ayako Nago on 2018/11/30.
//  Copyright © 2018年 Ayako Nago. All rights reserved.
//

import UIKit

class InputDataViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var all: Int =  0
    var clear: Int = 0
    
    var saveDataAllA : UserDefaults = UserDefaults.standard
    var saveDataClearA : UserDefaults = UserDefaults.standard
    var saveDataAllB : UserDefaults = UserDefaults.standard
    var saveDataClearB : UserDefaults = UserDefaults.standard
    var saveDataAllC : UserDefaults = UserDefaults.standard
    var saveDataClearC : UserDefaults = UserDefaults.standard
    var saveDataAllD : UserDefaults = UserDefaults.standard
    var saveDataClearD : UserDefaults = UserDefaults.standard
    var saveDataAllE : UserDefaults = UserDefaults.standard
    var saveDataClearE : UserDefaults = UserDefaults.standard
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let DataCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath)
        DataCell.textLabel!.text = DataListArray[indexPath.row]
        return DataCell
    }
    
    
    var DataListArray = [String]()
    
    var saveData : UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
        print("Did")
        
        if UserDefaults.standard.object(forKey: "DataList") != nil {
            DataListArray = saveData.object(forKey: "DataList") as! [String]
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataListArray.count
    }
    
    @IBAction func ok(){
        all = all + 1
        clear = clear + 1
        
    }
    
    @IBAction func ng(){
        all = all + 1
    }
    
    
}
