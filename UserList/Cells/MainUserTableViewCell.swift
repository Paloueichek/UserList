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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialize() {
        let nameLabel = UILabel(frame: .zero)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        let emailLabel = UILabel(frame: .zero)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        let phoneLabel = UILabel(frame: .zero)
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    

    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.textLabel?.text = nil
        self.detailTextLabel?.text = nil
        self.imageView?.image = nil
    }
}
