//
//  UserInfo.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/7/23.
//

import Foundation

struct UserInfo {
    init(name: String = "", dob: Date = Date(), weight: Double = UserInfo.minWeight) {
        self.name = name
        self.dob = dob
        self.weight = weight
    }
    
    var name: String
    var dob: Date
    var weight: Double
}

extension UserInfo {
    private static let maxAge       = 200
    private static let minWeight    = 1.0
    private static let maxWeight    = 1000.0
    
    static let rngBirthDate: ClosedRange<Date> = {
        let calendar = Calendar.current
        let minAgeDate = calendar.date(byAdding: .year, value: -maxAge, to: .now)
        let maxAgeDate = Date()
        
        return minAgeDate!...maxAgeDate
    }()
    
    static let rngWeight = minWeight...maxWeight
    
    static func calculateAge(birthDate: Date) -> Int {
        Calendar.current.dateComponents([.year], from: birthDate, to: Date()).year!
    }
}
