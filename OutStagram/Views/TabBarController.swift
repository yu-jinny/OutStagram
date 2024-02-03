//
//  TabBarController.swift
//  OutStagram
//
//  Created by t2023-m0028 on 1/27/24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // HomeVC 설정
        let homeVC = HomeVC()
        homeVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Home"), tag: 0)

        // ProfileVC 설정
        let profileVC = ProfileVC()
        profileVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Profile"), tag: 1)

        // 탭바에 뷰컨트롤러 추가
        setViewControllers([homeVC, profileVC], animated: false)

        // 탭바 스타일 설정
        tabBar.barTintColor = .white
        tabBar.tintColor = .black
    }
}
