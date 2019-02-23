//
//  MainViewController.swift
//  AfricaPerspectives
//
//  Created by Seoungwoo Do on 20/02/2019.
//  Copyright © 2019 Seoungwoo Do. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        setupView()
    }
}


extension MainViewController {
    fileprivate func setupView() {
        let btnLogin = UIButton(type: UIButton.ButtonType.system)
        let btnWrite = UIButton(type: UIButton.ButtonType.system)
        
        view.addSubview(btnLogin)
        view.addSubview(btnWrite)
        
        [
            btnWrite.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            btnWrite.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            btnWrite.topAnchor.constraint(equalTo: top, constant: 20),
            btnWrite.bottomAnchor.constraint(equalTo: btnLogin.topAnchor, constant: -20),
            
            btnLogin.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            btnLogin.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            btnLogin.topAnchor.constraint(equalTo: btnWrite.bottomAnchor, constant: 20),
            btnLogin.bottomAnchor.constraint(equalTo: bottom, constant: -20),
        ].forEach{$0.isActive = true}
        
        btnWrite.backgroundColor = .red
        btnLogin.backgroundColor = .yellow
    }
}
