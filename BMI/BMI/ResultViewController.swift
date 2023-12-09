//
//  ResultViewController.swift
//  BMI
//
//  Created by Woochan Jeong on 2023/12/09.
//

import UIKit

class ResultViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        label.text = "BMI 결과값"
        return label
    }()
    
    let resultValueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .systemPink
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, resultValueLabel, subTitleLabel])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 15
        return stackView
    }()
    
    private lazy var retryButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .link
        button.setTitle("다시 계산하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(retryButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurateUI()
    }
    
    func configurateUI() {
        view.backgroundColor = .gray
        
        view.addSubview(mainStackView)
        view.addSubview(retryButton)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        retryButton.translatesAutoresizingMaskIntoConstraints = false 
        
        NSLayoutConstraint.activate([
            mainStackView.widthAnchor.constraint(equalToConstant: 200),
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130),
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            resultValueLabel.heightAnchor.constraint(equalToConstant: 50),
            
            retryButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            retryButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            retryButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            retryButton.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
    
    @objc func retryButtonPressed() {
        dismiss(animated: true)
    }
    
}
