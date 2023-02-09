//
//  LITDayTabView.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/6/23.
//

import SwiftUI

struct LITDayTabView: View {
    @EnvironmentObject var litViewModel: LITViewModel
    
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    LITGreetingView(name: litViewModel.userInfo.name)
                    Spacer()
                }
                
                LITDayProgressBarView()
                    .padding(30)
                Text("You need to drink \(litViewModel.liquidIntake.rounded) \(litViewModel.settings.volumeUnits.rawValue) of Liquid")
//                LITDayListView()
                Spacer()
            }
            .padding()
        }
    }
}

struct LITDayTabView_Previews: PreviewProvider {
    static var previews: some View {
        LITDayTabView()
            .environmentObject(LITViewModel())
    }
}
