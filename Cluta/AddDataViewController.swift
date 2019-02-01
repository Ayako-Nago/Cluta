//
//  AddDataViewController.swift
//  Cluta
//
//  Created by Ayako Nago on 2018/11/16.
//  Copyright © 2018年 Ayako Nago. All rights reserved.
//

import UIKit

class AddDataViewController: UIViewController{
    
    var DataDictionary : [String:Any] = ["name":"name","Aok":0,"Ang":0,"Bok":0,"Bng":0,"Cok":0,"Cng":0,"Dok":0,"Dng":0,"Eok":0,"Eng":0]
    
    var DataListArray : [[String: Any]]!
    
    var saveData : UserDefaults = UserDefaults.standard
    
    @IBOutlet weak var AddTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataListArray = [DataDictionary]
        if UserDefaults.standard.object(forKey: "DataList") != nil {
            DataListArray = saveData.object(forKey: "DataList") as? [Dictionary<String,Any>]
        }

        
    }
    
    @IBAction func save(_ sender: Any) {
        
        
        DataListArray.append(["name":AddTextField.text!,"Aok":0,"Ang":0,"Bok":0,"Bng":0,"Cok":0,"Cng":0,"Dok":0,"Dng":0,"Eok":0,"Eng":0])
        
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

