//
//  UIViewController+Ext.swift
//  Followers App
//
//  Created by Abdallah Mahameed on 19/04/2024.
//

import UIKit

extension UIViewController {
    
    func presentAlertOnMainThread(title: String, body: String, buttonTitle: String)  {
        DispatchQueue.main.async {
            let alertVC = CustomAlert(alertTitleText: title, alertDescText: body, alertButtonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
