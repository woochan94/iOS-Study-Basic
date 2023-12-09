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
        
        heightTextField.delegate = self
        weightTextField.delegate = self
        
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
    
    func calculateBMI() -> Double {
        guard let heightText = heightTextField.text,
              let weightText = weightTextField.text,
              let height = Double(heightText),
              let weight = Double(weightText) else {
            return 0.0
        }
        
        var bmi = weight / (height * height) * 10000
        bmi = round(bmi * 10) / 10
        return bmi
    }
    
    func getBackgroundColor(bmi: Double) -> UIColor {
        switch bmi {
        case ..<18.6:
            return UIColor(displayP3Red: 22/255, green: 231/255, blue: 207/255, alpha: 1)
        case 18.6..<23.0:
            return UIColor(displayP3Red: 212/255, green: 251/255, blue: 121/255, alpha: 1)
        case 23.0..<25.0:
            return UIColor(displayP3Red: 218/255, green: 127/255, blue: 163/255, alpha: 1)
        case 25.0..<30.0:
            return UIColor(displayP3Red: 255/255, green: 150/255, blue: 141/255, alpha: 1)
        case 30.0...:
            return UIColor(displayP3Red: 255/255, green: 100/255, blue: 78/255, alpha: 1)
        default:
            return UIColor.black
        }
    }
    
    func getBMIAdviceString(bmi: Double) -> String {
        switch bmi {
        case ..<18.6:
            return "저체중"
        case 18.6..<23.0:
            return "표준"
        case 23.0..<25.0:
            return "과체중"
        case 25.0..<30.0:
            return "중도비만"
        case 30.0...:
            return "고도비만"
        default:
            return ""
        }
    }
    
    @objc func calcButtonPressed() {
        if self.weightTextField.text == "" || self.heightTextField.text == "" {
            titleLabel.text = "키와 몸무게를 모두 입력해 주세요."
            titleLabel.textColor = .red
            return
        }
        
        let resultViewController = ResultViewController()
        resultViewController.modalPresentationStyle = .fullScreen
        
        let bmi = calculateBMI()
        resultViewController.result = bmi
        resultViewController.backgroundColor = getBackgroundColor(bmi: bmi)
        resultViewController.advice = getBMIAdviceString(bmi: bmi)
        
        present(resultViewController, animated: true)
        
        titleLabel.text = "키와 몸무게를 입력해 주세요"
        titleLabel.textColor = .black
        heightTextField.text = ""
        weightTextField.text = ""
    }
    
}

extension ViewController: UITextFieldDelegate {
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
            self.view.endEditing(true)
        }
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
