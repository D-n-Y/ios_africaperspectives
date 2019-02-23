//
//  OfflineViewController.swift
//  TodolistApp
//
//  Created by Seoungwoo Do on 21/02/2019.
//  Copyright © 2019 Seoungwoo Do. All rights reserved.
//

import UIKit

class OfflineViewController: UICollectionViewController{

    let databaseFrame = UIView()
    let goToLogin = UIButton(type: UIButton.ButtonType.system)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
    }
    
    func setupView() {
        view.addSubview(databaseFrame)
    }

}
