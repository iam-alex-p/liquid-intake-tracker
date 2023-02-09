//
//  LITTimeOfDayList.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/7/23.
//

import SwiftUI

struct LITTimeOfDayList: View {
    let timeOfDay: String
    
    var body: some View {
//        List {
            ForEach(["1", "2", "3", "4"].indices) { number in
                Text(String(number))
            }
//            .navigationTitle(timeOfDay)
//        }
    }
}

struct LITTimeOfDayList_Previews: PreviewProvider {
    static var previews: some View {
        LITTimeOfDayList(timeOfDay: "Morning")
    }
}
