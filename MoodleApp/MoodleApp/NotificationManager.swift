//
//  NotificationManager.swift
//  MoodleApp
//
//  Created by adel on 13.11.2024.
//

import UserNotifications

class NotificationManager {
    
    static func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("Notification permission granted.")
            } else {
                print("Notification permission denied.")
            }
        }
    }

    static func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Assignment Deadline"
        content.body = "Your assignment for High Performance Computing is due soon!"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            }
        }
    }
}
