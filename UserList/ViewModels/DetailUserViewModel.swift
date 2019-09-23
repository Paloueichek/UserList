//
//  DetailUserViewModel.swift
//  UserList
//
//  Created by Patrick Aloueichek on 9/17/19.
//  Copyright © 2019 Patrick Aloueichek. All rights reserved.
//

import Foundation

protocol DetailUserDelegate {
    func refreshView()
}

final class DetailUserViewModel {
    
    var networkManager: NetworkManagerImp
    var delegate: DetailUserDelegate?
    var posts: Posts?
    weak var appCoordinator: AppCoordinator?
    var user: User
    
    init(networkManager: NetworkManagerImp, appCoordinator: AppCoordinator, user: User) {
         self.networkManager = networkManager
         self.appCoordinator = appCoordinator
         self.user = user
    }
    
    func getPosts() {
        networkManager.getPosts(for: user) { [weak self] (result) in
            switch result {
            case .success(let posts):
                DispatchQueue.main.async {
                    self?.posts = posts
                    self?.delegate?.refreshView()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func didSelect(post: Posts) {
        guard let posts = posts else { return }
          appCoordinator?.openPostsScreen(with: posts)
      }
      
}
