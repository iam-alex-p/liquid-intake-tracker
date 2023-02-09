//
//  LITDayListView.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/6/23.
//

import SwiftUI

struct LITDayListView: View {
    var body: some View {
        List {
            LITTimeOfDayList(timeOfDay: "Morning")
                .navigationTitle("Test")
            LITTimeOfDayList(timeOfDay: "Afternoon")
            LITTimeOfDayList(timeOfDay: "Evening")
            LITTimeOfDayList(timeOfDay: "Night")
        }
//        NavigationView {
//            List {
//                Section(header: Label("Morning", systemImage: "sunrise")) {
//
//                }
//
//                Section(header: Label("Afternoon", systemImage: "sun.min")) {
//
//                }
//
//                Section(header: Label("Evening", systemImage: "sunset")) {
//
//                }
//
//                Section(header: Label("Night", systemImage: "moon")) {
//
//                }
//            }
//            .navigationTitle("Daily Progress")
//            .toolbar {
//                ToolbarItem(placement: .primaryAction) {
//                    Button {
//
//                    } label: {
//                        Image(systemName: "plus")
//                    }
//
//                }
//            }
//        }
    }
}

struct LITDayListView_Previews: PreviewProvider {
    static var previews: some View {
        LITDayListView()
    }
}
