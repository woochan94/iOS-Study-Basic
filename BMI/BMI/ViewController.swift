//
//  ViewController.swift
//  BMI
//
//  Created by 정우찬 on 2023/12/07.
//

import UIKit

class ViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "키와 몸무게를 입력해 주세요"
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private let heightLabel: UILabel = {
        let label = UILabel()
        label.text = "키"
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    private let heightTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 8.0, height: 0.0))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var heightStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [heightLabel, heightTextField])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    private let weightLabel: UILabel = {
        let label = UILabel()
        label.text = "몸무게"
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    private let weightTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 8.0, height: 0.0))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var weightStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [weightLabel, weightTextField])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, heightStackView, weightStackView])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var calcButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .link
        button.setTitle("BMI 계산하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(calcButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurateUI()
    }
    
    func configurateUI() {
        view.backgroundColor = .gray
        
        view.addSubview(mainStackView)
        view.addSubview(calcButton)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        calcButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            heightLabel.heightAnchor.constraint(equalToConstant: 35),
            heightLabel.widthAnchor.constraint(equalToConstant: 60),
            
            weightLabel.heightAnchor.constraint(equalToConstant: 35),
            weightLabel.widthAnchor.constraint(equalToConstant: 60),
            
            calcButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            calcButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            calcButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            calcButton.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
    
    @objc func calcButtonPressed() {
        let resultViewController = ResultViewController()
        resultViewController.modalPresentationStyle = .fullScreen
        present(resultViewController, animated: true)
    }
    
}

