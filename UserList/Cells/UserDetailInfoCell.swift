//
//  UserDetailCell.swift
//  UserList
//
//  Created by Patrick Aloueichek on 9/18/19.
//  Copyright © 2019 Patrick Aloueichek. All rights reserved.
//

import UIKit

class UserDetailInfoCell: UITableViewCell {
    var addressTitleLabel = UILabel()
    var addressLabel = UILabel()
    
    var companyTitleLabel = UILabel()
    var companyLabel = UILabel()
    
    var websiteTitleLabel = UILabel()
    var websiteLabel = UILabel()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [addressTitleLabel,
                                                       addressLabel,
                                                       companyTitleLabel,
                                                       companyLabel,
                                                       websiteTitleLabel,
                                                       websiteLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
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
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        
        self.addressTitleLabel.text = "Adres"
        self.addressTitleLabel.font = .boldSystemFont(ofSize: 14)
        
        self.companyTitleLabel.text = "Firma"
        self.companyTitleLabel.font = .boldSystemFont(ofSize: 14)
        
        self.websiteTitleLabel.text = "Strona"
        self.websiteTitleLabel.font = .boldSystemFont(ofSize: 14)
        
        self.addressLabel.font = .systemFont(ofSize: 14, weight: .light)
        self.companyLabel.font = .systemFont(ofSize: 14, weight: .light)
        self.websiteLabel.font = .systemFont(ofSize: 14, weight: .light)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.addressLabel.text = nil
        self.companyLabel.text = nil
        self.websiteLabel.text = nil
    }
}

