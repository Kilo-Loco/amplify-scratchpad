//
//  CRUDOContentView.swift
//  amplify-scratchpad
//
//  Created by Kyle Lee on 6/15/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import SwiftUI

struct CRUDOContentView: View {
    
    let ampService = AmpService()
    
    var body: some View {
        VStack(spacing: 100) {
            Button(
                action: create,
                label: {
                    Text("Create")
                }
            )
            Button(
                action: read,
                label: {
                    Text("Read")
                }
            )
            Button(
                action: update,
                label: {
                    Text("Update")
                }
            )
            Button(
                action: delete,
                label: {
                    Text("Delete")
                }
            )
            Button(
                action: observe,
                label: {
                    Text("Observe")
                }
            )
        }
    }
    
    private func create() {
        print("create")
    }
    
    private func read() {
        print("read")
    }
    
    private func update() {
        print("update")
    }
    
    private func delete() {
        print("delete")
    }
    
    private func observe() {
        print("observe")
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CRUDOContentView()
    }
}
