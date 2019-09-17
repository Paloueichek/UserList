//
//  HeaderUIView.swift
//  UserList
//
//  Created by Patrick Aloueichek on 9/17/19.
//  Copyright © 2019 Patrick Aloueichek. All rights reserved.
//

import UIKit

class HeaderUIView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupImage()
    }
    
    func setupImage() {
        let imageView = UIImageView()
        imageView.frame = frame
        imageView.image = UIImage(named: "ayo-ogunseinde-THIs-cpyebg-unsplash")
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

