//
//  LITDayTabView.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/6/23.
//

import SwiftUI

struct LITDayTabView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    LITGreetingView()
                    Spacer()
                }
                
                LITDayProgressBarView()
                    .padding(30)
                
                LITDayListView()
            }
            .padding()
        }
    }
}

struct LITDayTabView_Previews: PreviewProvider {
    static var previews: some View {
        LITDayTabView()
    }
}
