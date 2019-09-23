//
//  PostsViewController.swift
//  UserList
//
//  Created by Patrick Aloueichek on 9/23/19.
//  Copyright © 2019 Patrick Aloueichek. All rights reserved.
//

import UIKit


class PostsViewController: UIViewController {
    
    var tableView = UITableView()
    var viewModel: PostsViewModel
    
    
    init(viewModel: PostsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
  private  func setupTableView() {
   view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
    viewModel.delegate = self
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = false
    self.tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    self.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    self.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    self.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    tableView.register(PostsDetailTableViewCell.self, forCellReuseIdentifier: "elo")
    }

}

extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "elo") as! PostsDetailTableViewCell
        cell.titleLabel.text = viewModel.posts[indexPath.row].title
        cell.descriptionLabel.text = viewModel.posts[indexPath.row].body
        return cell
    }


}

extension PostsViewController: PostsViewModelDelegate {
    func refreshView() {
        tableView.reloadData()
    }
    
}

