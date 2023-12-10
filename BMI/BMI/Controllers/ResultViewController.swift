//
//  ResultViewController.swift
//  BMI
//
//  Created by Woochan Jeong on 2023/12/09.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmi: BMI?
    private let resultView = BMIResultView()
    
    override func loadView() {
        view = resultView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAddTarget()
        setupValue()
    }
    
    func setupAddTarget() {
        resultView.retryButton.addTarget(self, action: #selector(retryButtonPressed), for: .touchUpInside)
    }
    
    func setupValue() {
        if let model = self.bmi {
            resultView.resultValueLabel.text = String(model.value)
            resultView.resultValueLabel.backgroundColor = model.matchColor
            resultView.subTitleLabel.text = model.advice
        }
    }
    
    @objc func retryButtonPressed() {
        dismiss(animated: true)
    }
    
}
