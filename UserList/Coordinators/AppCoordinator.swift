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
    
    convenience init(withWindow window: UIWindow?, navigationController: UINavigationController) {
        guard let mainWindow = window else { fatalError("Application can't be initialized") }
        self.init(withNavigationController: navigationController)
        mainWindow.rootViewController = navigationController
    }
    
    override func start(withCallback callback: CoordinatorCallback? = nil) {
        super.start(withCallback: callback)
    }
}
