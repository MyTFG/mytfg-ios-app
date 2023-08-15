//
//  AppDelegate.swift
//  MyTFG
//
//  Created by Jakob Handke on 22.02.22.
//
// swiftlint:disable line_length

import Foundation
import UIKit
import Firebase
import FirebaseMessaging

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        FirebaseConfiguration.shared.setLoggerLevel(.min)

        UNUserNotificationCenter.current().delegate = self
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { _, _ in }

        application.registerForRemoteNotifications()

        Messaging.messaging().delegate = self

        subscribeToTopics()
        return true
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
        subscribeToTopics()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        UIApplication.shared.applicationIconBadgeNumber = 0
    }

    private func subscribeToTopics() {
        Messaging.messaging().subscribe(toTopic: "mytfg-notifications")
        Messaging.messaging().subscribe(toTopic: "mytfg_app_messages")
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        process(response.notification)
        completionHandler()
    }

    private func process(_ notification: UNNotification) {
        let userInfo = notification.request.content.userInfo

        UIApplication.shared.applicationIconBadgeNumber = 0

        if let dayString = userInfo["daystr"] as? String {
            if dayString == "today" {
                MainTabViewModel.shared.selectedTab = .vplanToday
            } else if dayString == "tomorrow" {
                MainTabViewModel.shared.selectedTab = .vplanTomorrow
            }
        }
    }
}

extension AppDelegate: MessagingDelegate {
  func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
  }
}
