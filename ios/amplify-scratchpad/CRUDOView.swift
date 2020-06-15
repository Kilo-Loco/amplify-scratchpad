//
//  CRUDOView.swift
//  amplify-scratchpad
//
//  Created by Kyle Lee on 6/15/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import UIKit

class CRUDOView: UIView {
    var didTapCreate: (() -> Void)?
    var didTapRead: (() -> Void)?
    var didTapUpdate: (() -> Void)?
    var didTapDelete: (() -> Void)?
    var didTapObserve: (() -> Void)?
    
    private lazy var createButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var readButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Read", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var updateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Update", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Delete", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var observeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Observe", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 100
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
        stackView.addArrangedSubview(createButton)
        stackView.addArrangedSubview(readButton)
        stackView.addArrangedSubview(updateButton)
        stackView.addArrangedSubview(deleteButton)
        stackView.addArrangedSubview(observeButton)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    @objc
    private func didTapButton(_ sender: UIButton) {
        switch sender {
        case createButton:
            didTapCreate?()
            
        case readButton:
            didTapRead?()
            
        case updateButton:
            didTapUpdate?()
            
        case deleteButton:
            didTapDelete?()
            
        case observeButton:
            didTapObserve?()
            
        default:
            break
        }
    }
}
