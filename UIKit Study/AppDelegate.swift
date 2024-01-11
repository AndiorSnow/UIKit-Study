//
//  AppDelegate.swift
//  UIKit Study
//
//  Created by LMC60018 on 2024/1/9.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // The entry point for program, startup will only be executed once at program startup
        // Override point for customization after application launch.
        // Application configuration work
        print("\(type(of: self)): \(#function)")
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Create new scene configurations
        
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        print("\(type(of: self)): \(#function)")
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//        return UISceneConfiguration(name: "Navigation Configuration", sessionRole: connectingSceneSession.role)
        return UISceneConfiguration(name: "Tab Bar Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Discard scene sessions and release resources from discarded scenes
        
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        print("\(type(of: self)): \(#function)")
    }


}

