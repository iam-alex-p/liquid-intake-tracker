//
//  LITAddBeverageSheetView.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/11/23.
//

import SwiftUI

struct LITAddBeverageSheetView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var litVM: LITViewModel
    @EnvironmentObject var settingsVM: LITSettingsViewModel
    
    @State private var selectedBeverageType: BeverageType = .water
    @State private var liquidVolume = ""
    @State private var isAddNow = true
    @State private var intakeDate: Date = .now
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Beverage Type", selection: $selectedBeverageType) {
                    ForEach(BeverageType.allCases) { beverageType in
                        Text(beverageType.name)
                    }
                }
                .pickerStyle(.menu)
                
                HStack {
                    Text("Amount")
                    TextField("Volume, \(settingsVM.settings.volumeUnits.name)", text: $liquidVolume)
                }
                Toggle("Add as of Now", isOn: $isAddNow)
                
                if !isAddNow {
                    DatePicker("Intake Time", selection: $intakeDate, displayedComponents: [.hourAndMinute])
                }
            }
            .navigationTitle("Beverage")
            .multilineTextAlignment(.trailing)
            .autocorrectionDisabled()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        litVM.addLiquidIntake(type: selectedBeverageType.rawValue, volumeOZ: Double(liquidVolume) ?? 0.0, dateTime: intakeDate)
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddBeverageSheetView_Previews: PreviewProvider {
    static var previews: some View {
        LITAddBeverageSheetView()
            .environmentObject(LITViewModel())
            .environmentObject(LITSettingsViewModel())
    }
}
