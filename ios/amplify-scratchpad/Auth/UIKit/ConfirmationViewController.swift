//
//  ConfirmationViewController.swift
//  amplify-scratchpad
//
//  Created by Kyle Lee on 6/15/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import Amplify
import UIKit

class ConfirmationViewController: UIViewController {
    
    let username: String
    let ui: ConfirmationView
    
    init(username: String) {
        self.username = username
        self.ui = ConfirmationView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCommunication()
    }
    
    func configureCommunication() {
        ui.didTapConfirm = { [weak self] confirmationCode in
            self?.confirmSignUp(with: confirmationCode)
        }
    }
    
    func confirmSignUp(with confirmationCode: String) {
        _ = Amplify.Auth.confirmSignUp(for: username, confirmationCode: confirmationCode) { result in
            switch result {
            case .success(let signUpResult):
                print(signUpResult)
                
            case .failure(let error):
                print("Unable to confirm email \(error)")
            }
        }
    }
}
