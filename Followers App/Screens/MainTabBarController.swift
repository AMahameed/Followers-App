//
//  MainTabBarVC.swift
//  Followers App
//
//  Created by Abdallah Mahameed on 17/04/2024.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarConfig()
        navBarConfig()
    }
    
    private func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
        
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        let searchNC = UINavigationController(rootViewController: searchVC)
        
        return searchNC
    }
    
    
    private func createFavoritesNC() -> UINavigationController {
        let favoriteVC = FavoriteListVC()
        
        favoriteVC.title = "Favorites"
        favoriteVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        let favoriteNC = UINavigationController(rootViewController: favoriteVC)
        favoriteNC.navigationBar.prefersLargeTitles = true
        
        return favoriteNC
    }
    
    
    private func tabBarConfig() {
        UITabBar.appearance().tintColor = .systemGreen
        self.viewControllers = [createSearchNC(), createFavoritesNC()]
    }
    
    private func navBarConfig() {
        UINavigationBar.appearance().tintColor = .systemGreen
    }
    
}
