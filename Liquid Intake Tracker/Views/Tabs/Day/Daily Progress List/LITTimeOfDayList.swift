//
//  LITTimeOfDayList.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/7/23.
//

import SwiftUI

struct LITTimeOfDayList: View, Hashable {
    let dayPart: String
    
    let models: [DailyProgress] = [
        .init(liquidIntake: Double.random(in: 0.0...100.0), date: Date()),
        .init(liquidIntake: Double.random(in: 0.0...100.0), date: Date()),
        .init(liquidIntake: Double.random(in: 0.0...100.0), date: Date()),
        .init(liquidIntake: Double.random(in: 0.0...100.0), date: Date()),
        .init(liquidIntake: Double.random(in: 0.0...100.0), date: Date())
    ]
    
    var body: some View {
        NavigationStack {
            List(models) { liquidIntake in
                NavigationLink("Intake = \(liquidIntake.liquidIntake.rounded())", value: liquidIntake)
            }
            .navigationTitle(dayPart)
            .navigationDestination(for: DailyProgress.self, destination: { liquidIntake in
                Text("\(dayPart) - \(liquidIntake.liquidIntake.rounded)")
            })
        }
    }
}

struct LITTimeOfDayList_Previews: PreviewProvider {
    static var previews: some View {
        LITTimeOfDayList(dayPart: "Morning")
    }
}
