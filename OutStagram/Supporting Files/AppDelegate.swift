//
//  AppDelegate.swift
//  OutStagram
//
//  Created by t2023-m0028 on 1/27/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 네비게이션 컨트롤러를 사용하지 않고 MainVC를 rootViewController로 설정
        let mainViewController = MainVC()
        
        // 윈도우에 설정
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}
