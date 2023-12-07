//
//  SecondViewController.swift
//  Navigation
//
//  Created by 정우찬 on 2023/12/04.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    var passedString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.text = passedString
    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
