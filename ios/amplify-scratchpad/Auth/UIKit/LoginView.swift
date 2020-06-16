//
//  LoginView.swift
//  amplify-scratchpad
//
//  Created by Kyle Lee on 6/15/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import UIKit

class LoginView: UIView {
    var didTapLogin: ((_ username: String, _ password: String) -> Void)?
    
    private lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Username"
        textField.backgroundColor = .secondarySystemBackground
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.backgroundColor = .secondarySystemBackground
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
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
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginButton)
        addSubview(stackView)
        
        let guide = layoutMarginsGuide
        NSLayoutConstraint.activate([
            usernameTextField.heightAnchor.constraint(equalToConstant: 30),
            
            passwordTextField.heightAnchor.constraint(equalToConstant: 30),
            
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -16)
        ])
    }
    
    @objc
    private func didTapLoginButton() {
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        didTapLogin?(username, password)
    }
}
