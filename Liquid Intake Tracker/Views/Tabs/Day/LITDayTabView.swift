//
//  LITDayTabView.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/6/23.
//

import SwiftUI

struct LITDayTabView: View {
    @EnvironmentObject var settingsVM: LITSettingsViewModel
    @State private var isAddBeveragePresent = false
    @StateObject var litVM: LITViewModel = LITViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    LITGreetingView(name: settingsVM.userInfo.name)
                    Spacer()
                }
                .padding(.bottom, 50)
                
                LITDayProgressView(litVM: litVM)
                    .environmentObject(settingsVM)
                
                List(litVM.liquidIntakeEntries) { intakeEntry in
                    HStack {
                        Text(intakeEntry.type)
                        Spacer()
                        Text(intakeEntry.volumeOz.rounded)
                        Spacer()
                        Text("\(intakeEntry.dateTime)")
                    }
                }
//                LITDayListView()
//                    .padding(.top, 25)
                
                Button("Add a Beverage") {
                    isAddBeveragePresent.toggle()
                }
                .buttonStyle(.borderedProminent)
                .padding(.top, 50)
                .sheet(isPresented: $isAddBeveragePresent) {
                    LITAddBeverageSheetView()
                        .environmentObject(litVM)
                        .environmentObject(settingsVM)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct LITDayTabView_Previews: PreviewProvider {
    static var previews: some View {
        LITDayTabView()
            .environmentObject(LITSettingsViewModel())
    }
}
