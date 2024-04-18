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

        createTabBarItems()
    }
    
    private func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
        
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        let searchNC = UINavigationController(rootViewController: searchVC)
        searchNC.navigationBar.prefersLargeTitles = true
        
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
    
    
    private func createTabBarItems() {
        UITabBar.appearance().tintColor = .systemGreen
        UITabBar.appearance().backgroundColor = .systemBackground
        UITabBar.appearance().alpha = 0.85
        
        
        
        self.viewControllers = [createSearchNC(), createFavoritesNC()]
    }
    
}
