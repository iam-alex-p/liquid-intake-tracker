//
//  BeverageType.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/7/23.
//

import Foundation

enum BeverageType: String, Identifiable, CaseIterable {
    case water
    case coffee
    case tea
    case juice
    case fermented
    case soda
    case dairy
    case other
    
    var id: Self { self }
    
    var name: String { self.rawValue.capitalized }
}
