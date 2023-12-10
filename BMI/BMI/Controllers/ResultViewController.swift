//
//  ResultViewController.swift
//  BMI
//
//  Created by Woochan Jeong on 2023/12/09.
//

import UIKit

class ResultViewController: UIViewController {
    
    var result: Double?
    var backgroundColor: UIColor?
    var advice: String?
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
        if let result = self.result {
            resultView.resultValueLabel.text = String(result)
        }
        
        if let backgroundColor = self.backgroundColor {
            resultView.resultValueLabel.backgroundColor = backgroundColor
        }
        
        if let advice = self.advice {
            resultView.subTitleLabel.text = advice
        }
    }
    
    @objc func retryButtonPressed() {
        dismiss(animated: true)
    }
    
}
