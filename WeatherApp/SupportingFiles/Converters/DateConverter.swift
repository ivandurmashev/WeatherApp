//
//  DateConverter.swift
//  WeatherApp
//
//  Created by Иван Дурмашев on 20.05.2022.
//

import Foundation

enum DateConverter {
    static func showDayWithWeekDayIfNeeded(_ date: Date, currentDate: Date = Date.now) -> String {
        var result: String
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en")
        if isEqualDate(date, and: currentDate) {
            formatter.dateFormat = "d MMM"
            result = "Today, " + self.showShortDay(date)
        } else {
            formatter.dateFormat = "EE, d MMM"
            result = formatter.string(from: date)
        }
        return result
    }

    static func showShortDay(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en")
        formatter.dateFormat = "d MMM"
        return formatter.string(from: date)
    }
    
    static func getDateString(daysAgo: Int, toDate: Date = Date.now) -> String {
        let formatter = DateFormatter()
        let date = Calendar.current.date(byAdding: .day, value: -daysAgo, to: toDate) ?? toDate
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }

    static private func isEqualDate(_ firstDate: Date, and secondDate: Date = Date.now) -> Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MM YYYY"
        return formatter.string(from: secondDate) == formatter.string(from: firstDate)
    }
}
