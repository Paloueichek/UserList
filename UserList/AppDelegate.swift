//
//  AppDelegate.swift
//  UserList
//
//  Created by Patrick Aloueichek on 9/16/19.
//  Copyright © 2019 Patrick Aloueichek. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        self.appCoordinator = AppCoordinator(withWindow: self.window, navigationController: navigationController)
        
        self.window?.makeKeyAndVisible()
        self.appCoordinator.start()

        return true
    }



}

