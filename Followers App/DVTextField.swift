//
//  DVTextField.swift
//  Followers App
//
//  Created by Abdallah Mahameed on 18/04/2024.
//

import UIKit

class DVTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        dvTextFieldConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func dvTextFieldConfig() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 5
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor = .label
        tintColor = .black
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        backgroundColor = .tertiarySystemBackground
        
        autocorrectionType = .no
        keyboardType = .emailAddress
        placeholder = "Enter a Username"
        
    }

}
