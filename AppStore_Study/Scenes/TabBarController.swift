//
//  TabBarController.swift
//  AppStore_Study
//
//  Created by 이창형 on 2022/07/04.
//

import UIKit

class TabBarController: UITabBarController {
    
    private lazy var todayViewController: UIViewController = {
        let viewController = TodayViewController()
        let tabBarItem = UITabBarItem(
            title: "투데이",
            image: UIImage(systemName: "mail"),
            tag: 0
        )
        viewController.tabBarItem = tabBarItem
        
        return viewController
        
    }()
    
    private lazy var appViewController: UIViewController = {
        let viewController = UIViewController()
        let tabBarItem = UITabBarItem(
            title: "앱",
            image: UIImage(systemName: "square.stack.3d.up"),
            tag: 1
            )
        viewController.tabBarItem = tabBarItem
        
        
        return viewController
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 탭에서 어떤 뷰컨트롤러를 표시 시킬 것인가, 뷰컨트롤러의 갯수가 탭의 갯수임
        viewControllers = [todayViewController, appViewController]
    }


}

