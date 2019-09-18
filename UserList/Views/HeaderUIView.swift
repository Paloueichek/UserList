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
    
      init(frame: CGRect, user: User) {
        self.user = user
        super.init(frame: frame)
        setupImage()
    }
    
    func setupImage() {
        let nameLabel = UILabel()
        let emailLabel = UILabel()
        let phoneLabel = UILabel()
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height / 2.0))
       
        let stackView = UIStackView(arrangedSubviews: [nameLabel,emailLabel,phoneLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let imageView = UIImageView()
        
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 5
        
        nameLabel.text = user.name
        emailLabel.text = user.email
        phoneLabel.text = user.phone
        
        nameLabel.font = .systemFont(ofSize: 20, weight: .light)
        emailLabel.font = .systemFont(ofSize: 14, weight: .light)
        phoneLabel.font = .systemFont(ofSize: 14, weight: .light)
        
        imageView.frame = frame
        imageView.image = UIImage(named: "applover")
        imageView.contentMode = .scaleAspectFit
        imageView.addSubview(stackView)
        self.addSubview(imageView)
        
        imageView.topAnchor.constraint(equalTo: self.topAnchor)
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        
        stackView.addSubview(view)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

