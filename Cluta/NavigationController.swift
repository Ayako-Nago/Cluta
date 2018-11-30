//
//  NavigationController.swift
//  Cluta
//
//  Created by Ayako Nago on 2018/11/30.
//  Copyright © 2018年 Ayako Nago. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // ナビゲージョンアイテムの文字色
        navigationBar.tintColor = UIColor.white
        //
        // ナビゲーションバーのタイトルの文字色
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        // ナビゲーションバーの下の影を無くす
        navigationBar.shadowImage = UIImage()
    }

}
