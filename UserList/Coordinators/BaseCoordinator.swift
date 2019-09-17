//
//  BaseCoordinator.swift
//  UserList
//
//  Created by Patrick Aloueichek on 9/16/19.
//  Copyright © 2019 Patrick Aloueichek. All rights reserved.
//

import Foundation
import UIKit

class BaseCoordinator: Coordinator {
    
    var rootController: UINavigationController
    
    required init(withNavigationController controller: UINavigationController) {
        self.rootController = controller
    }
    
 
    func start(withCallback callback: CoordinatorCallback? = nil) {
        callback?()
    }
}
