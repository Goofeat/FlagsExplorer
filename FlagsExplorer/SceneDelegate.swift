//
//  SceneDelegate.swift
//  FlagsExplorer
//
//  Created by Raiymbek Azharbayev on 17.11.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        if let appDomain = Bundle.main.bundleIdentifier {
//            UserDefaults.standard.removePersistentDomain(forName: appDomain)
//        }
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.makeKeyAndVisible()
        window.rootViewController = ViewController()
        self.window = window
    }
    
}

