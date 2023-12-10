//
//  BMIResultView.swift
//  BMI
//
//  Created by Woochan Jeong on 2023/12/10.
//

import UIKit

class BMIResultView: UIView {
    
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
    
    public lazy var retryButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .link
        button.setTitle("다시 계산하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 8
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configurateUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurateUI() {
        self.backgroundColor = .gray
        
        self.addSubview(mainStackView)
        self.addSubview(retryButton)        
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        retryButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainStackView.widthAnchor.constraint(equalToConstant: 200),
            mainStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 130),
            mainStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            resultValueLabel.heightAnchor.constraint(equalToConstant: 50),
            
            retryButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            retryButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            retryButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            retryButton.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
    
}
