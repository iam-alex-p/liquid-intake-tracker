//
//  DailyProgress.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/9/23.
//

import Foundation

enum DayPart: String, CaseIterable, Identifiable {
    case morning
    case afternoon
    case evening
    case night
    
    var id: Self { self }
    
    var name: String { self.rawValue.capitalized }
}

let dayParts: [DayPart] = [.morning, .afternoon, .evening, .night]

struct DailyProgress: Identifiable, Hashable {
    let id = UUID()
    var liquidIntake: Double
    let date: Date
    let dayPart = dayParts.randomElement()!.name
}
