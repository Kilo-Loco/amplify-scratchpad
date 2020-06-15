//
//  CRUDOViewController.swift
//  amplify-scratchpad
//
//  Created by Kyle Lee on 6/15/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import UIKit

class CRUDOViewController: UIViewController {
    
    private let ui = CRUDOView()
    
    override func loadView() {
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCommunication()
    }
    
    private func configureCommunication() {
        ui.didTapCreate = {
            print("create")
        }
        
        ui.didTapRead = {
            print("read")
        }
        
        ui.didTapUpdate = {
            print("update")
        }
        
        ui.didTapDelete = {
            print("delete")
        }
        
        ui.didTapObserve = {
            print("observe")
        }
    }
}
