//
//  LITSettingsTabView.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/6/23.
//

import SwiftUI

struct LITSettingsTabView: View {
    @State private var editMode: EditMode = .inactive
    @EnvironmentObject var litViewModel: LITViewModel
    
    init() {}
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("User Information")) {
                    TextField(text: $litViewModel.userInfo.name) {
                        Text("Name")
                        
                    }
                    DatePicker("Birthdate", selection: $litViewModel.userInfo.dob, in: UserInfo.rngBirthDate, displayedComponents: [.date])
                    TextField("Weight", value: $litViewModel.userInfo.weight, format: .number)
                }
                
                Section(header: Text("Units")) {
                    Picker("Volume", selection: $litViewModel.settings.volumeUnits) {
                        ForEach(VolumeUnits.allCases) {
                            Text($0.rawValue)
                        }
                    }
                    Picker("Weight", selection: $litViewModel.settings.weightUnits) {
                        ForEach(WeightUnits.allCases) {
                            Text($0.rawValue)
                        }
                    }
                }
            }
            .environment(\.editMode, $editMode)
            .navigationBarTitle("Settings")
        }
    }
}

struct LITSettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        LITSettingsTabView()
            .environmentObject(LITViewModel())
    }
}
