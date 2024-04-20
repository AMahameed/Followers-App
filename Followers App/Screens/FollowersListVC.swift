//
//  FollowersListVC.swift
//  Followers App
//
//  Created by Abdallah Mahameed on 18/04/2024.
//

import UIKit

class FollowersListVC: UIViewController {
    
    var username: String?
    
    init(username: String? = nil) {
        self.username = username
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = username
        navigationController?.navigationBar.prefersLargeTitles = true
        
        Task {
            let result = try await NetworkManager.shared.getFollowers(for: username!)
            
            switch result {
            case .success(let followers):
                print(followers)
            case .failure(let error):
                presentAlertOnMainThread(title: "Oops, Data Vanished", body: error.rawValue, buttonTitle: "Ok")
                navigationController?.popViewController(animated: true)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
}
