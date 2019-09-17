//
//  MainUserListViewModel.swift
//  UserList
//
//  Created by Patrick Aloueichek on 9/17/19.
//  Copyright © 2019 Patrick Aloueichek. All rights reserved.
//

import Foundation

protocol MainUserListDelegate {
    func reloadTableView()
}

final class MainUserListViewModel {
    
    var networkManager: NetworkManagerImp
    var userArray: Users?
    var delegate: MainUserListDelegate?
    weak var appCoordinator: AppCoordinator?
    
    init(networkManager: NetworkManagerImp, appCoordinator: AppCoordinator) {
        self.networkManager = networkManager
        self.appCoordinator = appCoordinator
    }
    
    func getUsers() {
        networkManager.getUsers { [weak self] (result) in
            switch result {
            case .success(let users):
                DispatchQueue.main.async {
                    self?.userArray = users
                    self?.delegate?.reloadTableView()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func didSelect(user: User) {
        appCoordinator?.openDetailScreen(with: user)
    }
}
