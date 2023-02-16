//
//  LITSettingsTabView.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/6/23.
//

import SwiftUI

struct LITSettingsTabView: View {
    @EnvironmentObject private var settingsVM: LITSettingsViewModel
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("User Information")) {
                    HStack {
                        Text("Name")
                        TextField("", text: $settingsVM.userInfo.name)
                    }
                    
                    DatePicker("Birthdate", selection: $settingsVM.userInfo.dob, in: UserInfo.rngBirthDate, displayedComponents: [.date])
                    
                    HStack {
                        Text("Weight, \(settingsVM.settings.weightUnits.name)")
                        TextField("Weight", value: $settingsVM.userInfo.weight, format: .number)
                            .keyboardType(.numbersAndPunctuation)
                    }
                }
                
                Section(header: Text("Units")) {
                    Picker("Volume", selection: $settingsVM.settings.volumeUnits) {
                        ForEach(Settings.VolumeUnits.allCases) {
                            Text($0.rawValue)
                        }
                    }
                    
                    Picker("Weight", selection: $settingsVM.settings.weightUnits) {
                        ForEach(Settings.WeightUnits.allCases) {
                            Text($0.rawValue)
                        }
                    }
                    .onChange(of: settingsVM.settings.weightUnits) {
                        settingsVM.convertUserWeight($0)
                    }
                }
            }
            .pickerStyle(.menu)
            .multilineTextAlignment(.trailing)
            .autocorrectionDisabled()
            .onDisappear {
                Task {
                    await settingsVM.saveSettings()
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct LITSettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        LITSettingsTabView()
            .environmentObject(LITSettingsViewModel())
    }
}
