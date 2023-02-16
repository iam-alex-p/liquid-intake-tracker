//
//  Color+Ext.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/6/23.
//

import SwiftUI

extension Color {
    static let mainAppColor = Color("mainAppColor")
    static let fontColor    = Color("fontColor")
    
    static func getProgressColor(totalLiquidIntake: Double, currentLiquidIntake: Double) -> Color {
        let ratio = totalLiquidIntake / 4
        
        switch currentLiquidIntake {
        case 0..<ratio:
            return .red
        case ratio..<ratio * 2:
            return .orange
        case ratio * 2..<ratio * 3:
            return .yellow
        default:
            return .green
        }
    }
}
