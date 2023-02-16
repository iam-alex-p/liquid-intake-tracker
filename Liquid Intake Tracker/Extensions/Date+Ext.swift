//
//  Date+Ext.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/9/23.
//

import Foundation

extension Date {
    var dayPart: String {
        let hour = Calendar.current.component(.hour, from: self)
        
        switch hour {
        case 6..<12:
            return DayPart.morning.name
        case 12..<18:
            return DayPart.afternoon.name
        case 18..<22:
            return DayPart.evening.name
        default:
            return DayPart.night.name
        }
    }
}
