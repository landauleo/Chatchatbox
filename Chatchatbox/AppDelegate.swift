//
//  AppDelegate.swift
//  Fintech.chatbox
//
//  Created by Anna Nosova on 10/02/2019.
//  Copyright © 2019 Anna Nosova. All rights reserved.
//

import UIKit

enum ApplicationState: String {
    case notRunning, inactive, active, background, suspended
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    private var currentState = ApplicationState.notRunning
    
    private func loggingInfo(functionName: String) {
        #if DEBUG
        print(functionName)
        #endif
    }
    
    private func applicationChanged(to state: ApplicationState) {
        if (currentState == state && state == .background) {
            currentState = .suspended
            applicationChanged(to: .background)
            
            return
        }
        
        loggingInfo(functionName: "Application moved from state \(currentState) to state \(state)\n")
        currentState = state
    }
    
    private func printCurrentState() {
        #if DEBUG
        print("Current state: \(currentState)\n")
        #endif
    }
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        loggingInfo(functionName: "Function: \(#function))")
        printCurrentState()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        loggingInfo(functionName: "Function: \(#function))")
        applicationChanged(to: .inactive)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        loggingInfo(functionName: "Function: \(#function))")
        applicationChanged(to: .background)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        loggingInfo(functionName: "Function: \(#function))")
        applicationChanged(to: .inactive)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        loggingInfo(functionName: "Function: \(#function))")
        applicationChanged(to: .active)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        currentState = .suspended
        applicationChanged(to: .notRunning)
    }
    
    
}

