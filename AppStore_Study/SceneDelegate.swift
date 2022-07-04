//
//  SceneDelegate.swift
//  AppStore_Study
//
//  Created by 이창형 on 2022/07/04.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .systemBackground
        
        // 뷰컨 초기화해서 루트뷰 컨트롤러로 설정
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
    }

}

