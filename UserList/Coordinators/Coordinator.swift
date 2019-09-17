//
//  Coordinator.swift
//  UserList
//
//  Created by Patrick Aloueichek on 9/16/19.
//  Copyright © 2019 Patrick Aloueichek. All rights reserved.
//

import Foundation
import UIKit

typealias CoordinatorCallback = () -> Void

protocol Coordinator {
    
    var rootController: UINavigationController { get }
    
    init(withNavigationController controller: UINavigationController)
    
    func start(withCallback callback: CoordinatorCallback?)
}
