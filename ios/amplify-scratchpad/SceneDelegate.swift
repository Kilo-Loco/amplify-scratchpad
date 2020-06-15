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
        
//        window.rootViewController = useSwiftUI()
        window.rootViewController = useUIKit()
        
        self.window = window
        window.makeKeyAndVisible()
    }
    
    private func useSwiftUI() -> UIViewController {
        let contentView = CRUDOContentView()
        let hostingController = UIHostingController(rootView: contentView)
        return hostingController
    }
    
    private func useUIKit() -> UIViewController {
        CRUDOViewController()
    }

}

