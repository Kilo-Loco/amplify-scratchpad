//
//  SignUpController.swift
//  amplify-scratchpad
//
//  Created by Kyle Lee on 6/15/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import Amplify
import UIKit

class SignUpController: UIViewController {
    
    let ui = SignUpView()
    
    override func loadView() {
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCommunication()
        fetchCurrentAuthSession()
    }
    
    func configureCommunication() {
        ui.didTapSignUp = {
            print("sign up tapped")
        }
    }
    
    func fetchCurrentAuthSession() {
        _ = Amplify.Auth.fetchAuthSession { result in
            switch result {
            case .success(let session):
                print("Is user signed in - \(session.isSignedIn)")
            case .failure(let error):
                print("Fetch session failed with error \(error)")
            }
        }
    }
    
}
