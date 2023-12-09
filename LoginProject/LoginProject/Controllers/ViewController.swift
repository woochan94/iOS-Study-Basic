//
//  ViewController.swift
//  LoginProject
//
//  Created by 정우찬 on 2023/12/02.
//

import UIKit

final class ViewController: UIViewController {
    
    private let loginView = LoginView()
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAddTarget()
    }
    
    func setupAddTarget() {
        loginView.loginButton.addTarget(self, action: #selector(loginButonPressed), for: .touchUpInside)
        loginView.passwordResetButton.addTarget(self, action: #selector(resetButtonPressed), for: .touchUpInside)
    }
    
    @objc func resetButtonPressed() {
        let alert = UIAlertController(title: "비밀번호 바꾸기", message: "비밀번호를 바꾸시겠습니까?", preferredStyle: .alert)
        
        let success = UIAlertAction(title: "확인", style: .default) { action in
            print("확인")
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel) { action in
            print("취소")
        }
        
        alert.addAction(success)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    @objc func loginButonPressed() {
        
    }
    
}
