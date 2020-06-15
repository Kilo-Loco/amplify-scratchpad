//
//  AWSDataStorePlugin+Extensions.swift
//  amplify-scratchpad
//
//  Created by Kyle Lee on 6/15/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import Amplify
import AmplifyPlugins

extension AWSDataStorePlugin {
    convenience init() {
        self.init(modelRegistration: AmplifyModels())
    }
    
    static let `default` = AWSDataStorePlugin()
}
