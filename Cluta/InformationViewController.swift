//
//  InformationViewController.swift
//  Cluta
//
//  Created by Ayako Nago on 2018/11/30.
//  Copyright © 2018年 Ayako Nago. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {
    
    @IBAction func buttonTapped(sender : AnyObject) {
        performSegue(withIdentifier: "toInfo",sender: nil)
    }
    
}
