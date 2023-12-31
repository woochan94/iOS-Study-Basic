//
//  DetailViewController.swift
//  MemberList
//
//  Created by Woochan Jeong on 2023/12/31.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let detailView = DetailView()
    
    var member: Member?
    
    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtonAction()
        detailView.member = member
    }
    
    func setupButtonAction() {
        detailView.saveButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        
    }

}
