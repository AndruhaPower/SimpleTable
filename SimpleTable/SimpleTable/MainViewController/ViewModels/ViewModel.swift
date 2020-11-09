//
//  ViewModel.swift
//  SimpleTable
//
//  Created by Андрей Жуков on 09.11.2020.
//

import Foundation

/// Интерфейс вьюмодели для ячеек
protocol TableViewModel {
    
    var title: String? { get }
    var description: String? { get }
}

/// Уведомления о перёлете
struct Notice: TableViewModel {
    
    var flightDate: Date?
    var gate: String?
    
    // MARK: - TableViewModel

    var title: String? {
        "Вылет " + UsefulDateFormatter.convertDate(date: self.flightDate, today: false)
    }
    var description: String? { " - Выход " + (self.gate ?? "") }
}

/// Событие в календаре
class Event: TableViewModel {
    
    var startTime: Date?
    var endTime: Date?
    var name: String!
    
    // MARK: - TableViewModel

    var title: String? { "Cобытие " + self.name }
    var description: String? {
        let startString = UsefulDateFormatter.convertDate(date: self.startTime, today: true)
        let endString = UsefulDateFormatter.convertDate(date: self.endTime, today: true)
        return " - с \(startString) по \(endString)"
    }
}

/// Маршрут
class Move: TableViewModel {
    
    var fromPlace: String?
    var toPlace: String?
    var estimateTime: TimeInterval?
    
    // MARK: - TableViewModel

    var title: String? { "Маршрут от \(self.fromPlace ?? "") до \(self.toPlace ?? ""),"}
    var description: String? {
        guard let time = self.estimateTime else { return " - 0 минут" }
        let timeInMinutes = time / 60.0
        return String(Int(timeInMinutes)) + " - минут"
    }
}

