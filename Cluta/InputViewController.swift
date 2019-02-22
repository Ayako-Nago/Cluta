//
//  InputViewController.swift
//  Cluta
//
//  Created by Ayako Nago on 2018/11/30.
//  Copyright © 2018年 Ayako Nago. All rights reserved.
//
import UIKit

class InPutViewController: UIViewController {
    
    var segueNumber : UserDefaults = UserDefaults.standard
    let playerData = PlayerData.shared
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
