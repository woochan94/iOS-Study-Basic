//
//  ViewController.swift
//  LoginProject
//
//  Created by 정우찬 on 2023/12/02.
//

import UIKit

class ViewController: UIViewController {
    
    let emailTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }
    
    func makeUI() {
        view.addSubview(emailTextFieldView)
        
        // autoLayout 설정
        emailTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        emailTextFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30.0).isActive = true
        emailTextFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30.0).isActive = true
        emailTextFieldView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        emailTextFieldView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    
}

