//
//  SearchVC.swift
//  Followers App
//
//  Created by Abdallah Mahameed on 17/04/2024.
//

import UIKit

class SearchVC: UIViewController {
    
    let gitHubImage = UIImageView(image: UIImage(named: "gh-logo"))
    let searchTextField = DVTextField()
    let actionButton = DVButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    var isUsernameEntered: Bool {
        return !searchTextField.text!.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        imageConfig()
        textFieldConfig()
        buttonConfig()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    
    private func dismissKeyboardGesture() {
        let dismissKeyboardTapGesture = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(dismissKeyboardTapGesture)
    }
    
    
    private func imageConfig() {
        view.addSubview(gitHubImage)
        gitHubImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            gitHubImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            gitHubImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gitHubImage.heightAnchor.constraint(equalToConstant: 200),
            gitHubImage.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
    private func textFieldConfig() {
        view.addSubview(searchTextField)
        
        searchTextField.delegate = self
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: gitHubImage.bottomAnchor, constant: 40),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            searchTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    private func buttonConfig() {
        view.addSubview(actionButton)
        actionButton.addTarget(self, action: #selector(pushFollowersVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    @objc private func pushFollowersVC() {
        
        guard isUsernameEntered else {
            presentAlertOnMainThread(title: "Empty Username",
                                     body: "Please enter a username. We need to know who to Search for.",
                                     buttonTitle: "Ok")
            return
        }
        
        let followersVC = FollowersListVC(username: searchTextField.text)
        navigationController?.pushViewController(followersVC, animated: true)
    }
}

extension SearchVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.text = textField.text
        textField.resignFirstResponder()
        return true
    }
    
}
