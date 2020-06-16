//
//  SignUpController.swift
//  amplify-scratchpad
//
//  Created by Kyle Lee on 6/15/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {
    
    let ui = SignUpView()
    
    override func loadView() {
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCommunication()
    }
    
    func configureCommunication() {
        ui.didTapSignUp = {
            print("sign up tapped")
        }
    }
    
}
