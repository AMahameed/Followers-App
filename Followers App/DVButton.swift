//
//  DVButton.swift
//  Followers App
//
//  Created by Abdallah Mahameed on 18/04/2024.
//

import UIKit

class DVButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        dvButtonConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        dvButtonConfig()
    }
    
    private func dvButtonConfig() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 5
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel?.textAlignment = .center
        titleLabel?.textColor = .white
    }
    
}
