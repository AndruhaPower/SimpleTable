//
//  Constants.swift
//  SimpleTable
//
//  Created by Андрей Жуков on 09.11.2020.
//

import Foundation

/// Константы городов
public enum City: String, CaseIterable {
    
    case moscow = "Moscow"
    case saratov = "Saratov"
    case omsk = "Omsk"
    case newYork = "New York"
    case paris = "Paris"
    case armavir = "Armavir"
    case london = "London"
    case sochi = "Sochi"
    case erevan = "Erevan"
    case volgograd = "Volgograd"
    case ekaterinburg = "Ekaterinburg"
    case frankfurt = "Frankfurt-On-Main"
    
    /// Возвращает случайный элемент
    static var random: String? {
        return City.allCases.randomElement()?.rawValue
    }
}

/// Константы типов событий
public enum EventType: String, CaseIterable {
    
    case event = "Мероприятие"
    case flight = "Перелёт"
    case meeting = "Встреча"
    case interview = "Интервью"
    case jobInterview = "Собеседование"
    
    /// Возвращает случайный элемент
    static var random: String? {
        return EventType.allCases.randomElement()?.rawValue
    }
}
