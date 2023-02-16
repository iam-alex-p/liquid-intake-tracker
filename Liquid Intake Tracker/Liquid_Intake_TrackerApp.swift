//
//  Liquid_Intake_TrackerApp.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/6/23.
//

import SwiftUI

@main
struct Liquid_Intake_TrackerApp: App {
    @StateObject var settingsVM = LITSettingsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LITTabView()
                .environmentObject(settingsVM)
        }
    }
}
