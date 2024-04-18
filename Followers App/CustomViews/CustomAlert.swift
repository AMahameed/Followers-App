//
//  CustomAlert.swift
//  Followers App
//
//  Created by Abdallah Mahameed on 19/04/2024.
//

import UIKit

class CustomAlert: UIViewController {
    
    let alertBody = UIView()
    
    let alertTitle = UILabel()
    let alertDesc = UILabel()
    
    var alertTitleText: String!
    var alertDescText: String!
    var alertButtonTitle: String!
    
    init(alertTitleText: String, alertDescText: String, alertButtonTitle: String) {
        self.alertTitleText = alertTitleText
        self.alertDescText = alertDescText
        self.alertButtonTitle = alertButtonTitle
        
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        
        alertBodyConfig()
        alertTitleConfig()
        alertDescConfig()
        alertButtonConfig()
    }
    
    private func alertBodyConfig() {
        view.addSubview(alertBody)
        
        alertBody.translatesAutoresizingMaskIntoConstraints = false
        alertBody.backgroundColor = .systemBackground
        alertBody.layer.cornerRadius = 16
        alertBody.layer.borderWidth = 1
        alertBody.layer.borderColor = UIColor.white.cgColor
        
        
        NSLayoutConstraint.activate([
            alertBody.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alertBody.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertBody.heightAnchor.constraint(equalToConstant: 220),
            alertBody.widthAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    private func alertTitleConfig() {
        alertBody.addSubview(alertTitle)
        
        alertTitle.translatesAutoresizingMaskIntoConstraints = false
        alertTitle.text = alertTitleText
        alertTitle.font = .boldSystemFont(ofSize: 24)
        alertTitle.textColor = .label
        alertTitle.textAlignment = .center
        alertTitle.adjustsFontSizeToFitWidth = true
        alertTitle.minimumScaleFactor = 0.9
        
        NSLayoutConstraint.activate([
            alertTitle.topAnchor.constraint(equalTo: alertBody.topAnchor, constant: 20),
            alertTitle.leadingAnchor.constraint(equalTo: alertBody.leadingAnchor, constant: 10),
            alertTitle.trailingAnchor.constraint(equalTo: alertBody.trailingAnchor, constant: -10)
        ])
    }
    
    private func alertDescConfig(){
        alertBody.addSubview(alertDesc)
        
        alertDesc.translatesAutoresizingMaskIntoConstraints = false
        alertDesc.text = alertDescText
        alertDesc.font = UIFont.preferredFont(forTextStyle: .body)
        alertDesc.textColor = .systemGray
        alertDesc.textAlignment = .center
        alertDesc.numberOfLines = 0
        alertDesc.adjustsFontSizeToFitWidth = true
        alertDesc.minimumScaleFactor = 0.8
        
        NSLayoutConstraint.activate([
            alertDesc.topAnchor.constraint(equalTo: alertTitle.bottomAnchor, constant: 20),
            alertDesc.leadingAnchor.constraint(equalTo: alertBody.leadingAnchor, constant: 20),
            alertDesc.trailingAnchor.constraint(equalTo: alertBody.trailingAnchor, constant: -20)
        ])
    }
    
    private func alertButtonConfig() {
        let alertButton = DVButton(backgroundColor: .systemRed, title: alertButtonTitle)
        alertButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        alertBody.addSubview(alertButton)
        
        NSLayoutConstraint.activate([
            alertButton.bottomAnchor.constraint(equalTo: alertBody.bottomAnchor, constant: -20),
            alertButton.leadingAnchor.constraint(equalTo: alertBody.leadingAnchor, constant: 20),
            alertButton.trailingAnchor.constraint(equalTo: alertBody.trailingAnchor, constant: -20),
            alertButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc private func dismissVC() {
        self.dismiss(animated: true)
    }
}
