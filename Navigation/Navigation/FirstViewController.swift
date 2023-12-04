//
//  FirstViewController.swift
//  Navigation
//
//  Created by 정우찬 on 2023/12/04.
//

import UIKit

class FirstViewController: UIViewController {
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22)
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return button
    }()
    
    var passedString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .gray
        mainLabel.text = passedString
        
        view.addSubview(mainLabel)
        view.addSubview(backButton)
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            backButton.widthAnchor.constraint(equalToConstant: 70),
            backButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    @objc func backButtonPressed() {
        dismiss(animated: true)
    }
    
}
