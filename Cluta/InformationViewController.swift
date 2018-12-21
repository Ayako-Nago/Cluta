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
    
    @IBAction func buttonTapped(sender : AnyObject) {
        performSegue(withIdentifier: "toInfo",sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let infoViewController = segue.destination as? InfoViewController
        infoViewController?.number = number
    }
    
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      //  let infoViewController = segue.destination as? InfoViewController
     //   number
    //}
    
    @IBAction func aTapped(){
        number = 1
        //segueNumber.set(number, forKey:"infoNumber")
    }
    @IBAction func bTapped(){
        number = 2
        //segueNumber.set(number, forKey:"infoNumber")
    }
    @IBAction func cTapped(){
        number = 3
        //segueNumber.set(number, forKey:"infoNumber")
    }
    @IBAction func dTapped(){
        number = 4
        //segueNumber.set(number, forKey:"infoNumber")
    }
    @IBAction func eTapped(){
        number = 5
        //segueNumber.set(number, forKey:"infoNumber")
    }
    
}
