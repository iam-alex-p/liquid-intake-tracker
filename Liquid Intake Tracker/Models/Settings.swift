//
//  Settings.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/8/23.
//

import Foundation

enum VolumeUnits: String, CaseIterable, Identifiable {
    case l
    case oz
    case cups
    
    var id: Self { self }
}

enum WeightUnits: String, CaseIterable, Identifiable {
    case kg
    case lb
    
    var id: Self { self }
}
                        
struct Settings {
    var volumeUnits: VolumeUnits
    var weightUnits: WeightUnits
    
    init(volumeUnits: VolumeUnits = .oz, weightUnits: WeightUnits = .lb) {
        self.volumeUnits = volumeUnits
        self.weightUnits = weightUnits
    }
}
