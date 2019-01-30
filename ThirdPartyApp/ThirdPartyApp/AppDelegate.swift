//
//  AppDelegate.swift
//  ThirdPartyApp
//
//  Created by Bulat, Maksim on 24/01/2019.
//  Copyright © 2019 Bulat, Maksim. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if url.scheme?.contains("okayLink") ?? false {
            let message = url.host == "true" ? "Success" : "Unsuccess"
            let alert = UIAlertController(title: "Linking", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true)
        }
        return true
    }
}

