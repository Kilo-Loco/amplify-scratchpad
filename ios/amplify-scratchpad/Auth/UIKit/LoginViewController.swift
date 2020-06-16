//
//  LoginViewController.swift
//  amplify-scratchpad
//
//  Created by Kyle Lee on 6/15/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import Amplify
import UIKit

class LoginViewController: UIViewController {
    
    let ui = LoginView()
    
    override func loadView() {
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCommunication()
        fetchCurrentAuthSession()
    }
    
    func configureCommunication() {
        ui.didTapLogin = { [weak self] (username, password) in
            print(username, password)
            self?.login(username: username, password: password)
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
    
    func login(username: String, password: String) {
        _ = Amplify.Auth.signIn(username: username, password: password) { result in
            switch result {
            case .success(let signInResult):
                if signInResult.isSignedIn {
                    print("signed in successfully")
                } else {
                    print("something went wrong with sign in")
                }
                
            case .failure(let error):
                print("Sign in failed \(error)")
            }
        }
    }
    
}
