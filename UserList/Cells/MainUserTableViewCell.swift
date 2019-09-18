//
//  MainUserTableViewCell.swift
//  UserList
//
//  Created by Patrick Aloueichek on 9/17/19.
//  Copyright © 2019 Patrick Aloueichek. All rights reserved.
//

import Foundation
import UIKit

class MainUserTableViewCell: UITableViewCell {
    
    var nameLabel = UILabel()
    var emailLabel = UILabel()
    var phoneLabel = UILabel()
    
    lazy var stackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [nameLabel,emailLabel,phoneLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 2
       return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialize() {
      self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
           stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
           stackView.topAnchor.constraint(equalTo: self.topAnchor),
           stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
           stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
      self.nameLabel.font = .boldSystemFont(ofSize: 16)
      self.emailLabel.font = .systemFont(ofSize: 12, weight: .light)
      self.phoneLabel.font = .systemFont(ofSize: 12, weight: .light)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.nameLabel.text = nil
        self.emailLabel.text = nil
        self.phoneLabel.text = nil
    }
}
