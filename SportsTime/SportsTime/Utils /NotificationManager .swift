////
////  NotificationManager .swift
////  SportsTime
////
////  Created by Abdullah Essam on 02/05/2024.
////
//
//import Foundation
//import UserNotifications
//
//class NotificationManager{
//    let calendar :Calendar
//    let dateComponents :DateComponents
//    let trigger : UNCalendarNotificationTrigger
//    let request : UNNotificationRequest
//    let content : UNMutableNotificationContent
//    
//    init(dateComponents: DateComponents, trigger: UNCalendarNotificationTrigger, request: UNNotificationRequest, body:String) {
//        self.calendar = Calendar.current
//        self.dateComponents =
//        self.trigger = trigger
//        self.request = request
//        self.content = UNMutableNotificationContent()
//        self.content.title = title
//        self.content.body = body
//        self.content.sound = .default
//    }
//    
//    
//  
//}
//
//
//func fireNotification(calendar: Calendar, dateComponents: DateComponents, trigger: UNCalendarNotificationTrigger, request: UNNotificationRequest, content: UNMutableNotificationContent){
//    
//    let identifier = "Fixtures update "
//    let title = "jyfhfkfjhgfgfjyf"
//    let body = "hjhgjgjhjhv"
//    let hour = 17
//    let minute = 13
//    let isDaily = true
//    
//   
//    
// 
//   
//    
//    let calendar = Calendar.current
//    var dateComponents = DateComponents(calendar: calendar , timeZone: TimeZone.current)
//    dateComponents.hour = hour
//    dateComponents.minute = minute
//    
//    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: isDaily)
//    let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
//    notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
//    notificationCenter.add(request){
//        error in
//        if let error = error {
//            print("Error scheduling notf")
//        }else{
//            print("Added succefully")
//        }
//    }
//    
//}
//
//}
