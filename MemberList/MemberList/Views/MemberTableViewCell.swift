//
//  MemberTableViewCell.swift
//  MemberList
//
//  Created by Woochan Jeong on 2023/12/31.
//

import UIKit

class MemberTableViewCell: UITableViewCell {
    
    var member: Member? {
        didSet {
            guard var member = member else { return }
            mainImageView.image = member.memberImage
            memberNameLabel.text = member.name
            addressLabel.text = member.address
        }
    }
    
    //MARK: UI구성
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let memberNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 12)
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 5
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStackView() {
        self.addSubview(mainImageView)
        self.addSubview(stackView)
        
        stackView.addArrangedSubview(memberNameLabel)
        stackView.addArrangedSubview(addressLabel)
    }
    
    //MARK: AutoLayout 설정
    override func updateConstraints() {
        super.updateConstraints()
        setConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.mainImageView.clipsToBounds = true
        self.mainImageView.layer.cornerRadius = self.mainImageView.frame.width / 2
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 40),
            mainImageView.widthAnchor.constraint(equalToConstant: 40),
            mainImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            mainImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            memberNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.mainImageView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.mainImageView.bottomAnchor)
        ])
    }
    
}
