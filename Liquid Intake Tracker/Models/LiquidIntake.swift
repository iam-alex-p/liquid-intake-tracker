//
//  LiquidIntake.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/11/23.
//

import Foundation

struct LiquidIntake: Identifiable, Hashable {
    var id: UUID
    var type: String
    var volumeOz: Double
    var dateTime: Date
    
    init(type: String = "", volumeOz: Double = 0.0, dateTime: Date = .now) {
        self.id = UUID()
        self.type = type
        self.volumeOz = volumeOz
        self.dateTime = dateTime
    }
}

extension LiquidIntake {
    init(liquidIntakeMO: LiquidIntakeMO) {
        self.id = liquidIntakeMO.id ?? UUID()
        self.type = liquidIntakeMO.type ?? ""
        self.volumeOz = liquidIntakeMO.volumeOz
        self.dateTime = liquidIntakeMO.dateTime ?? .now
    }
}
