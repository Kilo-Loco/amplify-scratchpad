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
            try Amplify.add(plugin: AWSDataStorePlugin.default)
            try Amplify.configure()
            
            print("Amplify configured")
            
        } catch {
            fatalError("could not initialize amplify \(error)")
        }
    }
}
