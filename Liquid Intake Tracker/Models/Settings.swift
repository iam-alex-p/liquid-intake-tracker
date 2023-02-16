//
//  Settings.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/8/23.
//

import Foundation



struct Settings: Codable {
    var volumeUnits: VolumeUnits
    var weightUnits: WeightUnits
    
    init(volumeUnits: VolumeUnits = .oz, weightUnits: WeightUnits = .lb) {
        self.volumeUnits = volumeUnits
        self.weightUnits = weightUnits
    }
}

extension Settings {
    enum VolumeUnits: String, CaseIterable, Identifiable, Codable {
        case l
        case oz
        case cups
        
        var id: Self { self }
        var name: String { self == .l ? self.rawValue.capitalized : rawValue }
    }
    
    enum WeightUnits: String, CaseIterable, Identifiable, Codable {
        case kg
        case lb
        
        var id: Self { self }
        var name: String { self.rawValue }
    }
}
