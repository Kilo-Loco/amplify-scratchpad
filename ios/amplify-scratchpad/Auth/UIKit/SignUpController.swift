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
        ui.didTapSignUp = { [weak self] (email, password) in
            print(email, password)
            self?.signUp(email: email, password: password)
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
    
    func signUp(email: String, password: String) {
        let userAttributes = [AuthUserAttribute(.email, value: email)]
        let options = AuthSignUpRequest.Options(userAttributes: userAttributes)
        
        _ = Amplify.Auth.signUp(username: email, password: password, options: options) { result in
            switch result {
            case .success(let signUpResult):
                if case .confirmUser(let deliveryDetails, let additionalInfo) = signUpResult.nextStep {
                    print("delivery details \(String(describing: deliveryDetails))")
                    print("Additional info: \(String(describing: additionalInfo))")
                } else {
                    print("Sign up complete")
                }
                
            case .failure(let error):
                print("an error occured while registering a user \(error)")
            }
        }
    }
}
