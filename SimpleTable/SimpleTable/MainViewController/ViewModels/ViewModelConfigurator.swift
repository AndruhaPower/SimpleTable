//
//  ViewModelConfigurator.swift
//  SimpleTable
//
//  Created by Андрей Жуков on 09.11.2020.
//

import Foundation

enum ViewModelType: Int, CaseIterable {
    
    /// Маршрут
    case move = 0
    /// Событие
    case event = 1
    /// Уведомление
    case notice = 2
    
    var viewModel: TableViewModel {
        switch self {
        case .event:
            let event = Event()
            let startTime = UsefulDateFormatter.generateRandomDate(daysBack: .random(in: 5...10)) ?? Date()
            event.name = EventType.random
            event.startTime = startTime
            event.endTime = startTime + .random(in: 100...10000)
            return event
        case .move:
            let move = Move()
            move.fromPlace = City.random
            move.toPlace = City.random
            move.estimateTime = .random(in: 1000...10000)
            return move
        case .notice:
            var notice = Notice()
            notice.flightDate = UsefulDateFormatter.generateRandomDate(daysBack: .random(in: 1...10))
            notice.gate = "\(Int.random(in: 0...35))"
            return notice
        }
    }
}
