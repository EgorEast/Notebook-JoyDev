//
//  AppDelegate.swift
//  Notebook-JoyDev
//
//  Created by Egor Slobodskoy on 17.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let registrationScreenViewController = RegistrationScreenViewController()
    let navigationVC = UINavigationController.init(rootViewController: registrationScreenViewController)
        
    self.window = UIWindow(frame: UIScreen.main.bounds)
    self.window?.rootViewController = navigationVC
    self.window?.makeKeyAndVisible()
    self.window?.backgroundColor = .white
    return true
    }


}

