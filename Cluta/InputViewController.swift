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
    var number: Int!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let InputDataViewController = segue.destination as? InputDataViewController
        InputDataViewController?.number = number
    }
    
    @IBAction func aTapped(){
        number = 1
        performSegue(withIdentifier: "toAdd",sender: nil)
        print(number)
    }
    @IBAction func bTapped(){
        number = 2
        performSegue(withIdentifier: "toAdd",sender: nil)
        print(number)
    }
    @IBAction func cTapped(){
        number = 3
        performSegue(withIdentifier: "toAdd",sender: nil)
        print(number)
    }
    @IBAction func dTapped(){
        number = 4
        performSegue(withIdentifier: "toAdd",sender: nil)
        print(number)
    }
    @IBAction func eTapped(){
        number = 5
        performSegue(withIdentifier: "toAdd",sender: nil)
        print(number)
    }
    
}
