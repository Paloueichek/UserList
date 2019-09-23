//
//  PostsViewModel.swift
//  UserList
//
//  Created by Patrick Aloueichek on 9/23/19.
//  Copyright © 2019 Patrick Aloueichek. All rights reserved.
//

import Foundation

protocol PostsViewModelDelegate {
    func refreshView()
}

class PostsViewModel {
    
    var delegate: PostsViewModelDelegate?
    var networking: NetworkManagerImp
    var posts: Posts
    var appCoordinator: AppCoordinator?
    
    init(networking: NetworkManagerImp,appCoordinator: AppCoordinator, posts: Posts) {
        self.networking = networking
        self.appCoordinator = appCoordinator
        self.posts = posts
        
    }
    
  
}
