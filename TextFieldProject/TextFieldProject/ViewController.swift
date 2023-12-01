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
        // 화면 진입시 키보드 올리기
        textField.becomeFirstResponder()
        button.layer.cornerRadius = 5
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let prevText = textField.text else { return true }
        let currentLength = prevText.count + string.count
        return currentLength <= 10
    }
    
    // 빈화면 클릭시 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        // 키보드 내리기
        textField.resignFirstResponder()
    }
    
}

