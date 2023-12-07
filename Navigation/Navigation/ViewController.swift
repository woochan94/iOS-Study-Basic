//
//  ViewController.swift
//  Navigation
//
//  Created by 정우찬 on 2023/12/04.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func codeNextButtonPressed(_ sender: UIButton) {
        let firstVC = FirstViewController()
        firstVC.modalPresentationStyle = .fullScreen
        firstVC.passedString = "안녕하세요!"
        
        // 코드로 UI를 구성하면 모든 저장속성이 메모리에 한번에 올라가서 아래 코드가 동작할 수 있음
        // Storyboard로 UI를 구성하면 먼저 ViewController를 메모리에 올리고,
        // 나중에 Storyboard를 메모리에 올린 후 ViewController와 Storyboard를 연결하는 일련의 과정을 거치게 됨
        // 따라서 아래와 같이 접근시 에러가 발생함
        // firstVC.mainLabel.text = "안녕하세요!"
        
        present(firstVC, animated: true)
    }
    
    @IBAction func storyboardWithCodeButonPressed(_ sender: UIButton) {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as! SecondViewController
        secondVC.passedString = "iOS 프로그래밍!"
        
        present(secondVC, animated: true)
    }
    
    @IBAction func storyboardWithSegueButtonPressed(_ sender: UIButton) {
        
    }
    
}

