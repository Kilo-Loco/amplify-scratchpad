//
//  SceneDelegate.swift
//  amplify-scratchpad
//
//  Created by Kyle Lee on 6/15/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = rootController(for: .auth, using: .UIKit)
        self.window = window
        window.makeKeyAndVisible()
    }
    
    func rootController(for feature: Feature, using userInterface: UserInterface) -> UIViewController? {
        switch (feature, userInterface) {
        case (.auth, .SwiftUI):
            return nil
            
        case (.auth, .UIKit):
            return authUIKit
            
        case (.dataStore, .SwiftUI):
            return dataStoreSwiftUI
            
        case (.dataStore, .UIKit):
            return dataStoreUIKit
            
        }
    }
    
    private var authUIKit: UIViewController {
        SignUpController()
    }
    
    private var dataStoreSwiftUI: UIViewController {
        let contentView = CRUDOContentView()
        let hostingController = UIHostingController(rootView: contentView)
        return hostingController
    }
    
    private var dataStoreUIKit: UIViewController {
        CRUDOViewController()
    }

}

extension SceneDelegate {
    enum Feature {
        case auth, dataStore
    }
    
    enum UserInterface {
        case SwiftUI, UIKit
    }
}
