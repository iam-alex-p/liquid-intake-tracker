//
//  LITDayProgressView.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/6/23.
//

import SwiftUI

struct LITDayProgressView: View {
    @EnvironmentObject private var settingsVM: LITSettingsViewModel
    @ObservedObject var litVM: LITViewModel
    
    var body: some View {
        VStack {
            Text("That is how your day is going so far")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.bottom, 70)
            
            Gauge(value: litVM.currentIntake, in: 0...settingsVM.totalLiquidIntake) {
                
            } currentValueLabel: {
                Text("\(litVM.currentIntake.rounded) \(settingsVM.settings.volumeUnits.name)")
                    .multilineTextAlignment(.center)
                    .scaleEffect(0.7)
            }
            .gaugeStyle(.accessoryCircular)
            .scaleEffect(2.5)
            .tint(.blue)
            
            Text("You need to drink \(settingsVM.totalLiquidIntake.rounded) \(settingsVM.settings.volumeUnits.name) of Liquid today")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.top, 70)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 5)
            .shadow(color: Color.getProgressColor(totalLiquidIntake: settingsVM.totalLiquidIntake, currentLiquidIntake: litVM.currentIntake), radius: 10)
            .foregroundColor(Color(.systemBackground)))
        
    }
}

struct LITDayProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        LITDayProgressView(litVM: LITViewModel())
            .environmentObject(LITSettingsViewModel())
    }
}
