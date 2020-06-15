//
//  AmpService.swift
//  amplify-scratchpad
//
//  Created by Kyle Lee on 6/15/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import Amplify
import AmplifyPlugins
import Foundation

final class AmpService {
    
    func configure() {
        do {
            // Auth
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            
            // DataStore
            try Amplify.add(plugin: AWSAPIPlugin()) // Needed after connecting to backend
            try Amplify.add(plugin: AWSDataStorePlugin.default)
            
            // Amplify
            try Amplify.configure()
            
            print("Amplify configured")
            
        } catch {
            fatalError("could not initialize amplify \(error)")
        }
    }
}
