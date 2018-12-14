//
//  DataViewController.swift
//  Cluta
//
//  Created by Ayako Nago on 2018/11/09.
//  Copyright © 2018年 Ayako Nago. All rights reserved.
//

import UIKit

class DataViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
   
    
    
    var DataListArray = [[String: Any]]()
    
    var saveData : UserDefaults = UserDefaults.standard
    
   // @IBOutlet var table : UITableView!
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Did")
        
        if UserDefaults.standard.object(forKey: "DataList") != nil {
            DataListArray = saveData.object(forKey: "DataList") as! [[String: Any]]
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // todoListArray = saveData.object(forKey: "todoList") as! [String]
        if saveData.object(forKey: "DataList") != nil {
            DataListArray = saveData.object(forKey: "DataList") as! [[String: Any]]
        }
        table.reloadData()
        print(DataListArray)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataListArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let DataCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath)
        DataCell.textLabel!.text = DataListArray[indexPath.row]["name"] as? String
        return DataCell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DataListArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            print(DataListArray)
            saveData.set(DataListArray, forKey: "DataList")
            print(DataListArray)
        }
    }
    
    
    @IBAction func next(){
//        let addViewController = AddDataViewController()
//        self.present(addViewController, animated: true, completion: nil)
//        self.performSegue(withIdentifier: "toNext", sender: nil)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
