//
//  DateFormatter.swift
//  SimpleTable
//
//  Created by Андрей Жуков on 09.11.2020.
//

import Foundation

/// Конвертер даты в строку.
final class UsefulDateFormatter {
    
    /// Переводит дату в удобное представление строки.
    /// - Parameter date: Дата.
    /// - Returns: Строковое представление
    static func convertDate(date: Date?, today: Bool) -> String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = today ? "HH:mm" : "dd/MM/yy"
        
        if let date = date {
            return dateFormatterPrint.string(from: date)
        } else {
            return ""
       }
    }
    
    /// Генерирует слуачйную дату в указанный промежуток времени.
    /// - Parameter daysBack: Временной промежуток от текущего дня.
    /// - Returns: Случайная дата за переданный промежуток времени.
    static func generateRandomDate(daysBack: Int) -> Date? {
        let day = arc4random_uniform(UInt32(daysBack))+1
        let hour = arc4random_uniform(23)
        let minute = arc4random_uniform(59)
        
        let today = Date(timeIntervalSinceNow: 0)
        let gregorian  = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        var offsetComponents = DateComponents()
        offsetComponents.day = -1 * Int(day - 1)
        offsetComponents.hour = -1 * Int(hour)
        offsetComponents.minute = -1 * Int(minute)
        
        return gregorian?.date(byAdding: offsetComponents, to: today, options: .init(rawValue: 0))
    }
}
