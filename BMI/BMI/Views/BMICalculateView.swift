//
//  BMICalculateView.swift
//  BMI
//
//  Created by Woochan Jeong on 2023/12/10.
//

import UIKit

class BMICalculateView: UIView {
    
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "키와 몸무게를 입력해 주세요"
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    public let heightLabel: UILabel = {
        let label = UILabel()
        label.text = "키"
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    public let heightTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 8.0, height: 0.0))
        textField.leftViewMode = .always
        textField.placeholder = "cm 단위로 입력해주세요."
        textField.font = .systemFont(ofSize: 14)
        textField.keyboardType = .numbersAndPunctuation
        return textField
    }()
    
    private lazy var heightStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [heightLabel, heightTextField])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    public let weightLabel: UILabel = {
        let label = UILabel()
        label.text = "몸무게"
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    public let weightTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 8.0, height: 0.0))
        textField.leftViewMode = .always
        textField.placeholder = "kg 단위로 입력해주세요."
        textField.font = .systemFont(ofSize: 14)
        textField.keyboardType = .numbersAndPunctuation
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
    
    public lazy var calcButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .link
        button.setTitle("BMI 계산하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 8
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        configurateUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurateUI() {
        self.backgroundColor = .gray
        
        self.addSubview(mainStackView)
        self.addSubview(calcButton)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        calcButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 130),
            mainStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            mainStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            heightLabel.heightAnchor.constraint(equalToConstant: 35),
            heightLabel.widthAnchor.constraint(equalToConstant: 60),
            
            weightLabel.heightAnchor.constraint(equalToConstant: 35),
            weightLabel.widthAnchor.constraint(equalToConstant: 60),
            
            calcButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            calcButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            calcButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            calcButton.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
    
    
}


extension BMICalculateView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if Int(string) != nil || string == "" {
            return true
        }
        
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == heightTextField {
            weightTextField.becomeFirstResponder()
        }
        
        if textField == weightTextField {
            self.endEditing(true)
        }
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
}
