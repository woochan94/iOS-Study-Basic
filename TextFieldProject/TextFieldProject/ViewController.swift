//
//  ViewController.swift
//  TextFieldProject
//
//  Created by 정우찬 on 2023/11/30.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        setup()
    }
    
    func setup() {
        // UIViewController에 정의되어 있는 최상단 view
        view.backgroundColor = UIColor.gray
        textField.keyboardType = .emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        button.layer.cornerRadius = 5
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let prevText = textField.text else { return true }
        let currentLength = prevText.count + string.count
        return currentLength <= 10
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        
    }
    
}

