//
//  InformationViewController.swift
//  Cluta
//
//  Created by Ayako Nago on 2018/11/30.
//  Copyright © 2018年 Ayako Nago. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {
    
    var segueNumber : UserDefaults = UserDefaults.standard
    var number: Int!
    let playerData = PlayerData.shared
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let infoViewController = segue.destination as? InfoViewController
        infoViewController?.number = number
    }
    
    
    @IBAction func aTapped(){
        playerData.number = 1
        performSegue(withIdentifier: "toInfo",sender: nil)
    }
    @IBAction func bTapped(){
        playerData.number = 2
        performSegue(withIdentifier: "toInfo",sender: nil)
    }
    @IBAction func cTapped(){
        playerData.number = 3
        performSegue(withIdentifier: "toInfo",sender: nil)
    }
    @IBAction func dTapped(){
        playerData.number = 4
        performSegue(withIdentifier: "toInfo",sender: nil)
    }
    @IBAction func eTapped(){
        playerData.number = 5
        performSegue(withIdentifier: "toInfo",sender: nil)
    }
}
