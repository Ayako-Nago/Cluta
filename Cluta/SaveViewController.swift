//
//  SaveViewController.swift
//  Cluta
//
//  Created by Ayako Nago on 2019/03/19.
//  Copyright © 2019 Ayako Nago. All rights reserved.
//

import UIKit

class SaveViewController: UIViewController{
    
    var skillData: UserDefaults = UserDefaults.standard

    @IBOutlet var a:UILabel!
    @IBOutlet var b:UILabel!
    @IBOutlet var c:UILabel!
    @IBOutlet var d:UILabel!
    @IBOutlet var e:UILabel!
    var skillArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let savedArray = skillData.object(forKey: "skills")
        if savedArray != nil{
            skillArray = savedArray as![String]
        }else{
            skillArray = ["A","B","C","D","E"]
            
        }
        a.text = String(skillArray[0])
        b.text = String(skillArray[1]) 
        c.text = String(skillArray[2])
        d.text = String(skillArray[3])
        e.text = String(skillArray[4])
    }
    @IBOutlet var AddATextField: UITextField!
    @IBOutlet var AddBTextField: UITextField!
    @IBOutlet var AddCTextField: UITextField!
    @IBOutlet var AddDTextField: UITextField!
    @IBOutlet var AddETextField: UITextField!
    
    @IBAction func save(_ sender: Any){
        if AddATextField.text != "" {
            skillArray[0] = AddATextField.text!
        }
        if AddBTextField.text != "" {
            skillArray[1] = AddBTextField.text!
        }
        if AddCTextField.text != "" {
            skillArray[2] = AddCTextField.text!
        }
        if AddDTextField.text != "" {
            skillArray[3] = AddDTextField.text!
        }
        if AddETextField.text != "" {
            skillArray[4] = AddETextField.text!
        }
        
        print(skillArray)
        skillData.set(skillArray, forKey: "skills")
        self.navigationController?.popToRootViewController(animated: true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
