//
//  LoginViewController.swift
//  TodolistApp
//
//  Created by Seoungwoo Do on 21/02/2019.
//  Copyright © 2019 Seoungwoo Do. All rights reserved.
//
import UIKit

extension LoginVC {
    
    func setupOnlineView() {
        
        let loginLable = UILabel()
        let btnDeactivate = UIButton(type: .system)
        let btnLogin = UIButton(type: .system)
        let btnSignup = UIButton(type: .system)
        
        view.addSubview(blurView)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        [
            blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            blurView.topAnchor.constraint(equalTo: view.topAnchor),
        ].forEach{$0.isActive = true}
        blurView.effect = blurEffect
        blurView.isHidden = true
        
        view.addSubview(gradientLoginScreenMask)
        gradientLoginScreenMask.translatesAutoresizingMaskIntoConstraints = false
        [gradientLoginScreenMask.leadingAnchor.constraint(equalTo: blurView.leadingAnchor),
         gradientLoginScreenMask.trailingAnchor.constraint(equalTo: blurView.trailingAnchor),
         gradientLoginScreenMask.topAnchor.constraint(equalTo: blurView.topAnchor),
         gradientLoginScreenMask.bottomAnchor.constraint(equalTo: blurView.bottomAnchor),].forEach{$0.isActive = true}
        let gradientMask = CAGradientLayer()
        gradientMask.colors = [hexStringToUIColor(hex: "#000000").withAlphaComponent(0.5).cgColor, hexStringToUIColor(hex: "#FFFFFF").cgColor]
        gradientMask.locations = [0.0, 1.0]
        gradientMask.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientMask.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradientMask.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        gradientLoginScreenMask.layer.addSublayer(gradientMask)
        gradientLoginScreenMask.alpha = 0.3
        gradientLoginScreenMask.isHidden = true
        
        view.addSubview(viewContainer)
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
        [viewContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
         viewContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:15),
         viewContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
         viewContainer.heightAnchor.constraint(equalToConstant: (view.frame.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom - 120)),].forEach{$0.isActive = true}
//        viewContainer.backgroundColor = hexStringToUIColor(hex: "#FFFFFF").withAlphaComponent(0.3)
//        viewContainer.layer.cornerRadius = 16
        
//        let topLabelContainer = UIView()
//        view.addSubview(topLabelContainer)
//        topLabelContainer.translatesAutoresizingMaskIntoConstraints = false
//        [topLabelContainer.leadingAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutXAxisAnchor>#>),
//        topLabelContainer.trailingAnchor.constraint(equalTo: ),
//        topLabelContainer.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>),
//        topLabelContainer.heightAnchor.constraint(equalToConstant: <#T##CGFloat#>)
//        ]
        
        viewContainer.addSubview(btnDeactivate)
        btnDeactivate.translatesAutoresizingMaskIntoConstraints = false
        [
//            btnDeactivate.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            btnDeactivate.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            btnDeactivate.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            btnDeactivate.widthAnchor.constraint(equalToConstant: 32),
            btnDeactivate.heightAnchor.constraint(equalToConstant: 32)
        ].forEach{$0.isActive = true}
//        btnDeactivate.backgroundColor = hexStringToUIColor(hex: "#000000").withAlphaComponent(0.5)
        btnDeactivate.addTarget(self, action: #selector(deactivateConnectView), for: .touchUpInside)
        btnDeactivate.layer.cornerRadius = 16
        btnDeactivate.layer.masksToBounds = true
        
        let btnTextDeactivate = "x"
        let btnAttrDeactivate = NSAttributedString(string: btnTextDeactivate, attributes: [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 26)])
        btnDeactivate.setAttributedTitle(btnAttrDeactivate, for: .normal)
        
        viewContainer.addSubview(loginLable)
        loginLable.translatesAutoresizingMaskIntoConstraints = false
        [loginLable.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 30),
         loginLable.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: -30),
         loginLable.topAnchor.constraint(equalTo: btnDeactivate.bottomAnchor, constant: 5),
         loginLable.heightAnchor.constraint(equalToConstant: 23),
         ].forEach{$0.isActive = true}
        loginLable.text = "온라인 모드로 로그인하기"
        loginLable.font = UIFont.systemFont(ofSize: 17)
        loginLable.textColor = hexStringToUIColor(hex: "#000000").withAlphaComponent(0.8)
        loginLable.textAlignment = .center
        
        viewContainer.addSubview(idTextField)
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        [
            idTextField.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 20),
            idTextField.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: -20),
            idTextField.heightAnchor.constraint(equalToConstant: 32),
            idTextField.topAnchor.constraint(equalTo: loginLable.bottomAnchor, constant: 30),
        ].forEach{$0.isActive = true}
        idTextField.backgroundColor = hexStringToUIColor(hex: "#FFFFFF").withAlphaComponent(0.7)
        idTextField.textAlignment = .center
        idTextField.placeholder = "아이디를 입력하세요."
//        idTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: idTextField.frame.height))
//        idTextField.leftViewMode = .always
        idTextField.layer.cornerRadius = 4
        idTextField.layer.masksToBounds = true
        idTextField.alpha = 0.5
        
        viewContainer.addSubview(pwTextField)
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        [
            pwTextField.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 20),
            pwTextField.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: -20),
            pwTextField.heightAnchor.constraint(equalToConstant: 32),
            pwTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 20),
            ].forEach{$0.isActive = true}
        pwTextField.backgroundColor = hexStringToUIColor(hex: "#FFFFFF").withAlphaComponent(0.7)
        pwTextField.textAlignment = .center
        pwTextField.placeholder = "비밀번호를 입력하세요."
//        pwTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: pwTextField.frame.height))
//        pwTextField.leftViewMode = .always
        pwTextField.layer.cornerRadius = 4
        pwTextField.layer.masksToBounds = true
        pwTextField.isSecureTextEntry = true
        pwTextField.alpha = 0.5
        
        viewContainer.addSubview(btnLogin)
        btnLogin.translatesAutoresizingMaskIntoConstraints = false
        [btnLogin.leadingAnchor.constraint(equalTo: viewContainer.centerXAnchor, constant: 10),
         btnLogin.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: -20),
         btnLogin.heightAnchor.constraint(equalToConstant: 48),
         btnLogin.topAnchor.constraint(equalTo: pwTextField.bottomAnchor,constant: 20),].forEach{$0.isActive = true}
        
        btnLogin.backgroundColor = hexStringToUIColor(hex: "#000000").withAlphaComponent(0.5)
        btnLogin.layer.cornerRadius = 4
        
        let btnTextLogin = "로그인"
        let btnAttrLogin = NSAttributedString(string: btnTextLogin, attributes: [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 16)])
        
        btnLogin.setAttributedTitle(btnAttrLogin, for: .normal)
        btnLogin.addTarget(self, action: #selector(loginSuccess), for: .touchUpInside)
        
        
        viewContainer.addSubview(btnSignup)
        btnSignup.translatesAutoresizingMaskIntoConstraints = false
        [btnSignup.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 20),
         btnSignup.trailingAnchor.constraint(equalTo: viewContainer.centerXAnchor, constant: -10),
         btnSignup.heightAnchor.constraint(equalToConstant: 48),
         btnSignup.topAnchor.constraint(equalTo: pwTextField.bottomAnchor,constant: 20),].forEach{$0.isActive = true}
        
        let btnTextSignup = "계정 생성하기"
        let btnAttrSignup = NSAttributedString(string: btnTextSignup, attributes: [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 16)])
        
        btnSignup.setAttributedTitle(btnAttrSignup, for: .normal)
        btnSignup.addTarget(self, action: #selector(goToSignup), for: .touchUpInside)
        
        
        viewContainer.isHidden = true
        
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardDidShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardDidHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        if pwTextField.isFirstResponder {
            viewContainer.frame.size.height = view.frame.height - view.safeAreaInsets.top - 50 - keyboardHeight
        }
        
    }
    
    
    @objc func keyboardWillShow(_ notification: Notification) {
        do {
            keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue)
            let keyboardRectangle = keyboardFrame.cgRectValue
            keyboardHeight = keyboardRectangle.height
            print(keyboardHeight)
            viewContainer.frame.size.height = view.frame.height - view.safeAreaInsets.top - 50 - keyboardHeight
//                reloadInputViews()
            print("frame:")
            print(viewContainer.frame.size.height)
            viewContainer.updateConstraints()

        }
    }
    
    @objc func loginSuccess() {
        print("login pressed")
    }
    
    @objc func activateConnectView() {
        blurView.isHidden = false
        viewContainer.isHidden = false
        gradientLoginScreenMask.isHidden = false
        idTextField.becomeFirstResponder()
    }
    
    @objc func deactivateConnectView() {
        blurView.isHidden = true
        viewContainer.isHidden = true
        gradientLoginScreenMask.isHidden = true
        idTextField.text = ""
        pwTextField.text = ""
    }
    
    @objc func goToSignup () {
        
    }
}
