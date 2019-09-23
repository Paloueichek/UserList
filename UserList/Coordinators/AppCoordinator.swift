//
//  AppCoordinator.swift
//  UserList
//
//  Created by Patrick Aloueichek on 9/16/19.
//  Copyright © 2019 Patrick Aloueichek. All rights reserved.
//

import Foundation
import UIKit

final class AppCoordinator: BaseCoordinator {
    
    let networking = NetworkManagerImp()
    
    convenience init(withWindow window: UIWindow?, navigationController: UINavigationController) {
        guard let mainWindow = window else { fatalError("Application can't be initialized") }
        self.init(withNavigationController: navigationController)
        mainWindow.rootViewController = navigationController
    }
    
    override func start(withCallback callback: CoordinatorCallback? = nil) {
        super.start(withCallback: callback)
        let viewModel = MainUserListViewModel(networkManager: networking, appCoordinator: self)
        let mainUserListViewController = MainUserListViewController(viewModel: viewModel)
        rootController.setViewControllers([mainUserListViewController], animated: true)
    }
    
    func openDetailScreen(with user: User) {
        let viewModel = DetailUserViewModel(networkManager: networking, appCoordinator: self, user: user)
        let detailUserViewController = DetailUserViewController(viewModel: viewModel)
        rootController.pushViewController(detailUserViewController, animated: true)
    }
    
    func openPostsScreen(with posts: Posts) {
       let viewModel = PostsViewModel(networking: networking, appCoordinator: self, posts: posts)
       let postsViewController = PostsViewController(viewModel: viewModel)
        rootController.pushViewController(postsViewController, animated: true)
    }
}
