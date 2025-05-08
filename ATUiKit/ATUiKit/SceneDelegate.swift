//
//  SceneDelegate.swift
//  ATUiKit
//
//  Created by Engin Gülek on 4.05.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
             window?.windowScene = windowScene
        window?.rootViewController = UINavigationController(rootViewController: Router.createModule())
        window?.makeKeyAndVisible()
        
    }




}

