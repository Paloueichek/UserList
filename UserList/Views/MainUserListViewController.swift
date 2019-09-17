//
//  MainUserListViewController.swift
//  UserList
//
//  Created by Patrick Aloueichek on 9/16/19.
//  Copyright © 2019 Patrick Aloueichek. All rights reserved.
//

import Foundation
import UIKit

class MainUserListViewController: UINavigationController {
    
     var tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        
        view.addSubview(tableView)
        self.navigationBar.barTintColor = UIColor(hexString: "#00E9B3")
        self.title = "profiles" 
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.navigationBar.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
}



