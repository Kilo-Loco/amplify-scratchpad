//
//  LoginViewController.swift
//  amplify-scratchpad
//
//  Created by Kyle Lee on 6/15/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let ui = LoginView()
    
    override func loadView() {
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCommunication()
    }
    
    func configureCommunication() {
        ui.didTapLogin = { [weak self] (username, password) in
            print(username, password)
            self?.login(username: username, password: password)
        }
    }
    
    func login(username: String, password: String) {
        
    }
    
    
}
