//
//  LITViewModel.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/8/23.
//

import SwiftUI
import Combine

@MainActor
final class LITViewModel: ObservableObject {
    @Published private var dataManager: DataManager
    @Published var currentIntake = 0.0
    
    var anyCancellable: AnyCancellable?
    
    init(dataManager: DataManager = .shared) {
        self.dataManager = dataManager
        anyCancellable = dataManager.objectWillChange.sink { [weak self] (_) in
            self?.objectWillChange.send()
        }
    }
    
    var liquidIntakeEntries: [LiquidIntake] {
        dataManager.liquidIntakeArray
    }
    
    func addLiquidIntake(type: String, volumeOZ: Double, dateTime: Date) {
        dataManager.addLiquidIntakeEntry(type: type, volumeOz: volumeOZ, dateTime: dateTime)
    }
}
