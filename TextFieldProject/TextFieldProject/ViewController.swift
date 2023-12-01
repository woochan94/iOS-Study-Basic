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
    
    // 텍스트 필드의 입력을 시작할때 호출 (시작이 가능할지 여부 판단)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트 필드의 입력을 시작할때 호출
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        print("텍스트 필드 값 입력")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("\(#function): \(string)")
        return true
    }
    
    // 텍스트 필드의 리턴키가 허용할지 여부 판단
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트 필드의 입력이 끝날 때 호출 (끝낼지 여부 판단)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트 필드의 입력이 끝났을 때 호출
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
    }
    

    
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        
    }
    
}

