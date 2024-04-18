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
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension SearchVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
