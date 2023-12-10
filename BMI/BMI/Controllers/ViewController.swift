//
//  ViewController.swift
//  BMI
//
//  Created by 정우찬 on 2023/12/07.
//

import UIKit

class ViewController: UIViewController {
    
    private let bmiCalculateView = BMICalculateView()
    private var bmiManager = BMICalculateManager()
    
    override func loadView() {
        view = bmiCalculateView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAddTarget()
    }
    
    func setupAddTarget() {
        bmiCalculateView.calcButton.addTarget(self, action: #selector(calcButtonPressed), for: .touchUpInside)
    }
    
    @objc func calcButtonPressed() {
        if bmiCalculateView.weightTextField.text == "" || bmiCalculateView.heightTextField.text == "" {
            bmiCalculateView.titleLabel.text = "키와 몸무게를 모두 입력해 주세요."
            bmiCalculateView.titleLabel.textColor = .red
            return
        }
        
        let resultViewController = ResultViewController()
        resultViewController.modalPresentationStyle = .fullScreen
        resultViewController.bmi = bmiManager.getBMI(height: bmiCalculateView.heightTextField.text!, weight: bmiCalculateView.weightTextField.text!)
        
        present(resultViewController, animated: true)
        
        bmiCalculateView.titleLabel.text = "키와 몸무게를 입력해 주세요"
        bmiCalculateView.titleLabel.textColor = .black
        bmiCalculateView.heightTextField.text = ""
        bmiCalculateView.weightTextField.text = ""
    }
    
}
