//
//  ReminderService.swift
//  SpendR
//
//  Created by OYEGOKE TOMISIN on 04/09/2020.
//  Copyright © 2020 OYEGOKE TOMISIN. All rights reserved.
//

import Foundation
import NotificationCenter

struct ReminderService {

    let bills: [Bill]
    let notificationCenter = UNUserNotificationCenter.current()

    func start() {
        notificationCenter.removeAllPendingNotificationRequests()
        notificationCenter.requestAuthorization(options: [.alert, .sound]) { (authorized, _) in
            if authorized {
                self.bills.forEach { bill in
                    self.scheduleReminder(for: bill)
                }
            }
        }
    }

    private func scheduleReminder(for bill: Bill) {
        if let billId = bill.id {
            let content = getReminderContent(for: bill)
            let components = getDateComponent(for: bill.date.dateValue())
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
            let request = UNNotificationRequest(identifier: billId, content: content, trigger: trigger)
            notificationCenter.add(request, withCompletionHandler: nil)
        }
    }

    private func getReminderContent(for bill: Bill) -> UNNotificationContent {
        let content = UNMutableNotificationContent()
        content.title = "Your \(bill.name) bill is due today"
        content.body = "It's going to cost you \(bill.amount.currencyFormat() ?? "some money")"
        content.sound = .default
        return content
    }

    private func getDateComponent(for billScheduledate: Date) -> DateComponents {
        let date = Calendar.current.dateComponents([.month, .day], from: billScheduledate)
        var compnents = DateComponents()
        compnents.month = date.month
        compnents.day = date.day
        compnents.hour = 6
        return compnents
    }
}
