//
//  AddDataViewController.swift
//  Cluta
//
//  Created by Ayako Nago on 2018/11/16.
//  Copyright © 2018年 Ayako Nago. All rights reserved.
//

import UIKit

class AddDataViewController: UIViewController{
    
    var DataListArray : [DataDictionary]()
    var DataDictionary : [String:Any] = ["name":"name","A":0,"B":0,"C":0,"D":0,"E":0]
    
    //var DataListArray: Dictionary = ["name":"A","B":"C","D":"E"]
    
    var saveData : UserDefaults = UserDefaults.standard
    
    @IBOutlet weak var AddTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "DataList") != nil {
            DataListArray = saveData.object(forKey: "DataList") as! [Dictionary<String:Any>]
        }

        
    }
    
    @IBAction func save(_ sender: Any) {
        
        
        DataListArray.append(AddTextField.text!)
        
        AddTextField.text=""
        
        saveData.set(DataListArray, forKey: "DataList")
        
        self.dismiss(animated: true, completion: nil)
        
        print(DataListArray)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

