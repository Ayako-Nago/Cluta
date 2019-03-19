//
//  AddDataViewController.swift
//  Cluta
//
//  Created by Ayako Nago on 2018/11/16.
//  Copyright © 2018年 Ayako Nago. All rights reserved.
//

import UIKit

class AddDataViewController: UIViewController, UITextFieldDelegate{
//    var n: Int=0
    var DataDictionary : [String:Any] = [:]
    
    var DataListArray : [[String: Any]]!
    let playerData = PlayerData.shared
    var saveData : UserDefaults = UserDefaults.standard
    let saveN: UserDefaults = UserDefaults.standard
    
    @IBOutlet weak var AddTextField: UITextField! {
        didSet {
            AddTextField.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        playerData.n = 0
//        DataListArray = [DataDictionary]
        print("viewdidload",playerData.n)
        if UserDefaults.standard.object(forKey: "DataList") != nil {
            DataListArray = saveData.object(forKey: "DataList") as? [Dictionary<String,Any>] ?? [[:]]
        }
        
        
    }
    
    @IBAction func back(_ sender: Any){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        
//        playerData.n = 0
        print("befor",playerData.n)

        
        
        if DataListArray == nil {
            DataListArray = [["name":AddTextField.text!,"Aok":0,"Ang":0,"a":0,"Bok":0,"Bng":0,"b":0,"Cok":0,"Cng":0,"c":0,"Dok":0,"Dng":0,"d":0,"Eok":0,"Eng":0,"e":0,"n":playerData.n]]
        } else {
            DataListArray.append(["name":AddTextField.text!,"Aok":0,"Ang":0,"a":0,"Bok":0,"Bng":0,"b":0,"Cok":0,"Cng":0,"c":0,"Dok":0,"Dng":0,"d":0,"Eok":0,"Eng":0,"e":0,"n":playerData.n])
        }
        
       
         AddTextField.text = ""
//        }else {
//            DataListArray = ["name":AddTextField.text!,"Aok":0,"Ang":0,"a":0,"Bok":0,"Bng":0,"b":0,"Cok":0,"Cng":0,"c":0,"Dok":0,"Dng":0,"d":0,"Eok":0,"Eng":0,"e":0,"n":playerData.n]
//            AddTextField.text=""
//        }
       
        playerData.n = playerData.n + 1
        saveData.set(DataListArray, forKey: "DataList")
        
//        n=n+1

//        playerData.n = playerData.n + 1
        saveN.set(playerData.n, forKey: "num")
        print("after",playerData.n)
        self.dismiss(animated: true, completion: nil)
        
        print(DataListArray)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

