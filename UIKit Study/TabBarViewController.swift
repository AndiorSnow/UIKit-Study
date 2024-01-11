//
//  TabBarViewController.swift
//  UIKit Study
//
//  Created by LMC60018 on 2024/1/9.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "Navigation", bundle: nil)

        guard let vc = storyboard.instantiateInitialViewController() else { return }

        vc.tabBarItem.image = UIImage(named: "btn_stop")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.title = "Nav"
        viewControllers?.append(vc)
        tabBar.barTintColor = .white
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .gray

        vc.tabBarItem.badgeValue = "10"
        
        print(#fileID + "/" + #function)
    }
}
