//
//  CRUDOViewController.swift
//  amplify-scratchpad
//
//  Created by Kyle Lee on 6/15/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import Amplify
import Combine
import UIKit

class CRUDOViewController: UIViewController {
    
    private let ui = CRUDOView()
    
    private var postsSubscription: AnyCancellable?
    
    override func loadView() {
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCommunication()
    }
    
    private func configureCommunication() {
        ui.didTapCreate = { [weak self] in
            self?.createPost()
        }
        
        ui.didTapRead = { [weak self] in
            self?.read()
        }
        
        ui.didTapUpdate = {
            print("update")
        }
        
        ui.didTapDelete = { [weak self] in
            self?.deleteAll()
        }
        
        ui.didTapObserve = { [weak self] in
            self?.observe()
        }
    }
    
    func createPost() {
        let user = User(id: "1", name: "Kilo Loco")
        let post = Post(
            id: UUID().uuidString,
            user: user,
            text: "\(Date())",
            imageUrl: "https://www.some.url",
            createdTimestamp: Int(Date().timeIntervalSince1970)
        )
        
        Amplify.DataStore.save(post) { (result) in
            switch result {
            case .success(let post):
                print("Save successful, created post \(post)")
            case .failure(let error):
                print("failed to create post \(error)")
            }
        }
    }
    
    func read() {
        Amplify.DataStore.query(Post.self) { result in
            switch result {
            case .success(let posts):
                print(posts)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func deleteAll() {
        Amplify.DataStore.clear(completion: {_ in})
    }
    
    func observe() {
        postsSubscription = Amplify.DataStore.publisher(for: Post.self).print().sink(receiveCompletion: { completion in
            print(completion)
            if case .failure(let error) = completion {
                print("sub error \(error)")
            }
            
        }) { changes in
            
            do {
                let post = try changes.decodeModel(as: Post.self)
                print("updated post: \(post)")
                
            } catch {
                print("unable to decode")
            }
            
            print("sub mutation changes \(changes)")
        }
    }
}
