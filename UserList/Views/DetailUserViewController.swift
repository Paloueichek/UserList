//
//  DetailUserViewController.swift
//  UserList
//
//  Created by Patrick Aloueichek on 9/17/19.
//  Copyright © 2019 Patrick Aloueichek. All rights reserved.
//

import UIKit

class DetailUserViewController: UIViewController {
    
    var tableView = UITableView()
    var viewModel: DetailUserViewModel
    
    init(viewModel: DetailUserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.getPosts()
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
        tableView.register(PostsDetailTableViewCell.self, forCellReuseIdentifier: "detailCellId")
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        let headerView = HeaderUIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 400), user: viewModel.user)
        tableView.tableHeaderView = headerView
        tableView.register(UserDetailInfoCell.self, forCellReuseIdentifier: "userdetailcellid")
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        
    }
}

extension DetailUserViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.posts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "userdetailcellid", for: indexPath) as? UserDetailInfoCell else { fatalError() }
            cell.initialize()
            cell.addressLabel.text = viewModel.user.address.city
            cell.companyLabel.text = viewModel.user.company.name
            cell.websiteLabel.text = viewModel.user.website
            cell.selectionStyle = .none
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCellId", for: indexPath) as? PostsDetailTableViewCell else { fatalError() }
            cell.titleLabel.text = viewModel.posts?[indexPath.row].title
            cell.descriptionLabel.text = viewModel.posts?[indexPath.row].body
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let posts = viewModel.posts else { return }
        viewModel.didSelect(post: posts)
       
    }
}

extension DetailUserViewController: DetailUserDelegate {
    func refreshView() {
        tableView.reloadData()
    }
}
