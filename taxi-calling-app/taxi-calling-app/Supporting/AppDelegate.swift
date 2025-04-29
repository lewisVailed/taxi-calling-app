//
//  AppDelegate.swift
//  taxi-calling-app
//
//  Created by Ayberk Bilgiç on 17.11.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    var window: UIWindow?

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            window = UIWindow(frame: UIScreen.main.bounds)
            
            let tabBarController = UITabBarController()
            
            // Home Tab
            let homeVC = HomeController()
            let homeNav = UINavigationController(rootViewController: homeVC)
            homeNav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
            
            // Search Tab
            let searchVC = OpeningController()
            let searchNav = UINavigationController(rootViewController: searchVC)
            searchNav.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: nil)
            
            // Notifications Tab
            let notificationsVC = RegisterController()
            let notificationsNav = UINavigationController(rootViewController: notificationsVC)
            notificationsNav.tabBarItem = UITabBarItem(title: "Notifications", image: UIImage(systemName: "bell"), selectedImage: UIImage(systemName: "bell.fill"))
            
            // Settings Tab
            let settingsVC = HomeController()
            let settingsNav = UINavigationController(rootViewController: settingsVC)
            settingsNav.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape"), selectedImage: UIImage(systemName: "gearshape.fill"))
            
            tabBarController.viewControllers = [homeNav, searchNav, notificationsNav, settingsNav]
            
            // Assign the TabBarController as the root
            window?.rootViewController = tabBarController
            window?.makeKeyAndVisible()
            
            return true
        }
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

