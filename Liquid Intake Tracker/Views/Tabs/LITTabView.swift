//
//  LITTabView.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/6/23.
//

import SwiftUI

struct LITTabView: View {
    var body: some View {
        TabView {
            LITDayTabView()
                .tabItem {
                    Label("Your Day", systemImage: "cup.and.saucer")
                }
            LITStatsTabView()
                .tabItem {
                    Label("Statistics", systemImage: "calendar")
                }
            LITSettingsTabView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct LITTabView_Previews: PreviewProvider {
    static var previews: some View {
        LITTabView()
    }
}
