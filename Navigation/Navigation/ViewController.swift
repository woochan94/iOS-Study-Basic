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
        present(firstVC, animated: true)
    }
    
    @IBAction func storyboardWithCodeButonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func storyboardWithSegueButtonPressed(_ sender: UIButton) {
        
    }
    
}

