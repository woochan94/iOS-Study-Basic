//
//  Member.swift
//  MemberList
//
//  Created by Woochan Jeong on 2023/12/30.
//

import UIKit

protocol MemberDelegate: AnyObject {
    func addNewMember(_ member: Member)
    func update(index: Int, _ member: Member) 
}

struct Member {
    
    lazy var memberImage: UIImage? = {
        guard let name = name else {
            return UIImage(systemName: "person")
        }
        
        return UIImage(named: "\(name).png") ?? UIImage(systemName: "person")
    }()
    
    static var memberNumbers: Int = 0
    
    let memberId: Int
    var name: String?
    var age: Int?
    var phone: String?
    var address: String?
    
    init(name: String? = nil, age: Int? = nil, phone: String? = nil, address: String? = nil) {
        self.memberId = Member.memberNumbers
        
        self.name = name
        self.age = age
        self.phone = phone
        self.address = address
        
        Member.memberNumbers += 1
    }
}
