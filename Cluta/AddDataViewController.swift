//
//  AddDataViewController.swift
//  Cluta
//
//  Created by Ayako Nago on 2018/11/16.
//  Copyright © 2018年 Ayako Nago. All rights reserved.
//

import UIKit

class AddDataViewController: UIViewController{
//    var n: Int=0
    var DataDictionary : [String:Any] = ["name":"name","Aok":0,"Ang":0,"a":0,"Bok":0,"Bng":0,"b":0,"Cok":0,"Cng":0,"c":0,"Dok":0,"Dng":0,"d":0,"Eok":0,"Eng":0,"e":0,"n":0]
    
    var DataListArray : [[String: Any]]!
    let playerData = PlayerData.shared
    var saveData : UserDefaults = UserDefaults.standard
    
    @IBOutlet weak var AddTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        playerData.n = 0
        DataListArray = [DataDictionary]
        if UserDefaults.standard.object(forKey: "DataList") != nil {
            DataListArray = saveData.object(forKey: "DataList") as? [Dictionary<String,Any>]
        }
        
        
    }
    
    @IBAction func save(_ sender: Any) {
        
//        playerData.n = 0
        
        DataListArray.append(["name":AddTextField.text!,"Aok":0,"Ang":0,"a":0,"Bok":0,"Bng":0,"b":0,"Cok":0,"Cng":0,"c":0,"Dok":0,"Dng":0,"d":0,"Eok":0,"Eng":0,"e":0,"n":playerData.n])
        
        
        AddTextField.text=""
        
        saveData.set(DataListArray, forKey: "DataList")
        
//        n=n+1

        playerData.n = playerData.n + 1
        
        self.dismiss(animated: true, completion: nil)
        
        
        print(DataListArray)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

