//
//  ConfirmationView.swift
//  amplify-scratchpad
//
//  Created by Kyle Lee on 6/15/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import UIKit

class ConfirmationView: UIView {
    
    var didTapConfirm: ((_ confirmationCode: String) -> Void)?
    
    private lazy var confirmationTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Confirmation Code"
        textField.backgroundColor = .secondarySystemBackground
        return textField
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Confirm", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(didTapConfirmButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSelf()
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupSelf() {
        backgroundColor = .systemBackground
    }
    
    private func setupSubviews() {
        stackView.addArrangedSubview(confirmationTextField)
        stackView.addArrangedSubview(confirmButton)
        addSubview(stackView)
        
        let guide = layoutMarginsGuide
        NSLayoutConstraint.activate([
            confirmationTextField.heightAnchor.constraint(equalToConstant: 30),
            
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -16)
        ])
    }
    
    @objc
    private func didTapConfirmButton() {
        let confirmationCode = confirmationTextField.text ?? ""
        didTapConfirm?(confirmationCode)
    }
    
}
