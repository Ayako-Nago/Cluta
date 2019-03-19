//
//  InputViewController.swift
//  Cluta
//
//  Created by Ayako Nago on 2018/11/30.
//  Copyright © 2018年 Ayako Nago. All rights reserved.
//
import UIKit

class InPutViewController: UIViewController {
    
    var skillData: UserDefaults = UserDefaults.standard
    var segueNumber : UserDefaults = UserDefaults.standard
    let playerData = PlayerData.shared
    @IBOutlet var a:UILabel!
    @IBOutlet var b:UILabel!
    @IBOutlet var c:UILabel!
    @IBOutlet var d:UILabel!
    @IBOutlet var e:UILabel!
    var skillArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        skillArray = skillData.object(forKey: "skills") as! [String]
        a.text = String(skillArray[0])
        b.text = String(skillArray[1])
        c.text = String(skillArray[2])
        d.text = String(skillArray[3])
        e.text = String(skillArray[4])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    @IBAction func aTapped(){
        playerData.number = 1
        performSegue(withIdentifier: "toAdd",sender: nil)
    }
    @IBAction func bTapped(){
        playerData.number = 2
        performSegue(withIdentifier: "toAdd",sender: nil)
    }
    @IBAction func cTapped(){
        playerData.number = 3
        performSegue(withIdentifier: "toAdd",sender: nil)
    }
    @IBAction func dTapped(){
        playerData.number = 4
        performSegue(withIdentifier: "toAdd",sender: nil)
    }
    @IBAction func eTapped(){
        playerData.number = 5
        performSegue(withIdentifier: "toAdd",sender: nil)
    }
    
}
