//
//  ViewController.swift
//  TodolistApp
//
//  Created by Seoungwoo Do on 20/02/2019.
//  Copyright © 2019 Seoungwoo Do. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    let blurView = UIVisualEffectView()
    let blurEffect = UIBlurEffect(style: .regular)
    let viewContainer = UIView()
    let gradientLoginScreenMask = UIView()
    
    let idTextField = UITextField()
    let pwTextField = UITextField()

    var keyboardHeight:CGFloat = 0
    var keyboardFrame: NSValue!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupOnlineView()
        
    }

    func setupView() {
        let gradient1: CAGradientLayer = CAGradientLayer()
        
        gradient1.colors = [hexStringToUIColor(hex: "#FFCC00").cgColor, hexStringToUIColor(hex: "#ED2939").cgColor]
        gradient1.locations = [0.0, 1.0]
        gradient1.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient1.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient1.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/2)
//        ED2939
        let gradient2:CAGradientLayer = CAGradientLayer()
        gradient2.colors = [hexStringToUIColor(hex: "#ED2939").cgColor, hexStringToUIColor(hex: "#1A936F").cgColor]
        gradient2.locations = [0.0, 1.0]
        gradient2.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient2.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient2.frame = CGRect(x: 0, y: view.frame.height/2, width: view.frame.width, height: view.frame.height/2)
        view.layer.insertSublayer(gradient1, above: gradient2)
        view.layer.insertSublayer(gradient2, below: gradient1)
        
        let maskView = UIView()
        view.addSubview(maskView)
        let maskColor = hexStringToUIColor(hex: "#FFFFFF")
        maskView.backgroundColor = maskColor.withAlphaComponent(0.2)
        
        maskView.translatesAutoresizingMaskIntoConstraints = false
        maskView.topAnchor.constraint(equalTo: self.view.superview?.topAnchor ?? view.topAnchor).isActive = true
        maskView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        maskView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        maskView.bottomAnchor.constraint(equalTo: self.view.superview?.bottomAnchor ?? view.bottomAnchor).isActive = true
        
        let titleLabel = UILabel()
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 120).isActive = true
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 26)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.text = "AFRICAN\n\nPERSPECTIVES"
//        titleLabel.alpha = 0.8
        
        let titleImage = UIImageView()
        titleImage.image = UIImage(named: "africa_logo")
        view.addSubview(titleImage)
        titleImage.translatesAutoresizingMaskIntoConstraints = false
        titleImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30).isActive = true
        titleImage.widthAnchor.constraint(equalToConstant: view.frame.width/2).isActive = true
        titleImage.heightAnchor.constraint(equalToConstant: view.frame.width/2).isActive = true
        titleImage.contentMode = .scaleAspectFit
        titleImage.alpha = 0.2
        
        let btnWithoutConnection = UIButton(type: UIButton.ButtonType.system)
        let btnWithConnection = UIButton(type: UIButton.ButtonType.system)
        
        view.addSubview(btnWithConnection)
        view.addSubview(btnWithoutConnection)
        
        [btnWithConnection,btnWithoutConnection].forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
        
        [
            btnWithoutConnection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            btnWithoutConnection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            btnWithoutConnection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            btnWithoutConnection.heightAnchor.constraint(equalToConstant: 48),
            btnWithConnection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            btnWithConnection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            btnWithConnection.bottomAnchor.constraint(equalTo: btnWithoutConnection.topAnchor, constant: -20),
            btnWithConnection.heightAnchor.constraint(equalToConstant: 48),
        ].forEach{$0.isActive = true}
        
        [btnWithConnection,btnWithoutConnection].forEach{$0.backgroundColor = hexStringToUIColor(hex: "#FFFFFF").withAlphaComponent(0.1)}
        [btnWithConnection,btnWithoutConnection].forEach{$0.layer.cornerRadius = 4}
        
        let btnTextWithoutConnection = "오프라인 모드로 기록하기"
        let btnTextWithConnection = "온라인 모드로 로그인하기"
        let btnAttrWithoutConnection = NSAttributedString(string: btnTextWithoutConnection, attributes: [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 16)])
        let btnAttrWithConnection = NSAttributedString(string: btnTextWithConnection, attributes: [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 16)])
        btnWithoutConnection.setAttributedTitle(btnAttrWithoutConnection, for: .normal)
        btnWithConnection.setAttributedTitle(btnAttrWithConnection, for: .normal)
        
        btnWithConnection.addTarget(self, action: #selector(activateConnectView), for: .touchUpInside)
        btnWithoutConnection.addTarget(self, action: #selector(goOffline), for: .touchUpInside)
        
    }
    
    @objc func goOffline() {
        let nextVC = OfflineViewController()
        present(nextVC, animated: true, completion: nil)
    }
    
}

extension LoginVC {
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

