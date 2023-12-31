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
        if member != nil {
            member!.memberImage = detailView.mainImageView.image
            
            let memberId = Int(detailView.memberIdTextField.text!) ?? 0
            member!.name = detailView.nameTextField.text ?? ""
            member!.age = Int(detailView.ageTextField.text ?? "") ?? 0
            member!.phone = detailView.phoneNumberTextField.text ?? ""
            member!.address = detailView.addressTextField.text ?? ""
            
            detailView.member = member
            
            let index = navigationController!.viewControllers.count - 2
            let vc = navigationController?.viewControllers[index] as! ViewController
            vc.memberListManager.updateMemberInfo(index: memberId, member!)
        } else {
            
        }
        
        self.navigationController?.popViewController(animated: true)
    }

}
