//
//  DateFormat.swift
//  SportsTime
//
//  Created by raneem on 25/04/2024.
//

import Foundation


class DateFormat {
    
    static func getDate() -> (today: String, yesterday: String, tomorrow: String) {
        let date = Date()
        let calendar = Calendar.current
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let today = date
        let formattedToday = dateFormatter.string(from: today)

        let lastMonth = calendar.date(byAdding: .month, value: -1, to: date)!
        let formattedYesterday = dateFormatter.string(from: lastMonth)

        let nextMonth = calendar.date(byAdding: .month, value: 1, to: date)!
        let formattedTomorrow = dateFormatter.string(from: nextMonth)
        
        return (formattedToday, formattedYesterday, formattedTomorrow)
    }
}
