//
//  FourthViewController.swift
//  Navigation
//
//  Created by 정우찬 on 2023/12/04.
//

import UIKit

class FourthViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    var passedString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.text = passedString
    }
    
    @IBAction func backButonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
