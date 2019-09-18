//
//  MainUserListViewController.swift
//  UserList
//
//  Created by Patrick Aloueichek on 9/16/19.
//  Copyright © 2019 Patrick Aloueichek. All rights reserved.
//

import UIKit

class MainUserListViewController: UIViewController {
    
    var tableView = UITableView()
    var viewModel: MainUserListViewModel
    
    init(viewModel: MainUserListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
        viewModel.getUsers()
    }
    
    private func setupTableView() {
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.delegate = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.register(MainUserTableViewCell.self, forCellReuseIdentifier: "cellId")
    }
    
    private func setupNavigationBar() {
        self.title = "Profiles"
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0.9137254902, blue: 0.7019607843, alpha: 1)
    }
}

extension MainUserListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! MainUserTableViewCell
        tableView.estimatedRowHeight = 80
        cell.nameLabel.text = viewModel.userArray?[indexPath.row].name
        cell.emailLabel.text = viewModel.userArray?[indexPath.row].email
        cell.phoneLabel.text = viewModel.userArray?[indexPath.row].phone
        cell.initialize()
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let user = viewModel.userArray?[indexPath.row] else { return }
        viewModel.didSelect(user: user)
    }
}

extension MainUserListViewController: MainUserListDelegate {
    
    func reloadTableView() {
        tableView.reloadData()
    }
}

