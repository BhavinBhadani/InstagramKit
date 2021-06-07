//
//  TabBarViewController.swift
//  InstagramKit
//
//  Created by Appernaut on 05/06/21.
//

import UIKit

class TabBarViewController: UITabBarController {
    lazy public var homeViewController: UINavigationController = {
        let homeVC = HomeViewController()
        let homeNVC = getNavigationController(root: homeVC)
        homeNVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "ic_tab_home")!, selectedImage: UIImage(named: "ic_tab_home_selected")!)
        return homeNVC
    }()

    lazy public var searchViewController: UINavigationController = {
        let searchVC = SearchViewController()
        let searchNVC = getNavigationController(root: searchVC)
        searchNVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "ic_tab_search")!, selectedImage: UIImage(named: "ic_tab_search_selected")!)
        return searchNVC
    }()

    lazy public var reelsViewController: UINavigationController = {
        let marketVC = ReelsViewController()
        let marketNVC = getNavigationController(root: marketVC)
        marketNVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "ic_tab_reels")!, selectedImage: UIImage(named: "ic_tab_reels_selected")!)
        return marketNVC
    }()

    lazy public var activityViewController: UINavigationController = {
        let activityVC = ActivityViewController()
        let activityNVC = getNavigationController(root: activityVC)
        activityNVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "ic_tab_heart")!, selectedImage: UIImage(named: "ic_tab_heart_selected")!)
        return activityNVC
    }()

    lazy public var profileViewController: UINavigationController = {
        let profileVC = ProfileViewController()
        let profileNVC = getNavigationController(root: profileVC)
        profileNVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "ic_tab_user")!, selectedImage: UIImage(named: "ic_tab_user_selected")!)
        return profileNVC
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [homeViewController, searchViewController, reelsViewController, activityViewController, profileViewController]
        tabBar.barTintColor = .white
    }
}

// MARK: - Helpers
extension TabBarViewController {
    private func getNavigationController(root: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: root)
        navigationController.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.layoutIfNeeded()
        if #available(iOS 13.0, *) {
            navigationController.overrideUserInterfaceStyle = .light
        }
        return navigationController
    }
}
