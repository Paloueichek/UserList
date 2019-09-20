//
//  HeaderUIView.swift
//  UserList
//
//  Created by Patrick Aloueichek on 9/17/19.
//  Copyright © 2019 Patrick Aloueichek. All rights reserved.
//

import UIKit

class HeaderUIView: UIView {
    
    var user: User
    
   private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 20, weight: .light)
        return nameLabel
    }()
    
   private lazy var emailLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.font = .systemFont(ofSize: 20, weight: .light)
        emailLabel.numberOfLines = 0
        emailLabel.sizeToFit()
        return emailLabel
    }()
    
   private lazy var phoneLabel: UILabel = {
        let phoneLabel = UILabel()
        phoneLabel.font = .systemFont(ofSize: 20, weight: .light)
        phoneLabel.numberOfLines = 0
        phoneLabel.sizeToFit()
        return phoneLabel
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "applover")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
  private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.addArrangedSubview(self.nameLabel)
        stackView.addArrangedSubview(self.emailLabel)
        stackView.addArrangedSubview(self.phoneLabel)
        return stackView
    }()
    
      init(frame: CGRect, user: User) {
        self.user = user
        super.init(frame: frame)
        setupImage()
    }
    
    func setupImage() {
        self.nameLabel.text = user.name
        self.emailLabel.text = user.email
        self.phoneLabel.text = user.phone
 
        self.imageView.frame = frame
        self.addSubview(self.imageView)
        self.imageView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25),
            self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.stackView.heightAnchor.constraint(equalToConstant: 100)
            ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

