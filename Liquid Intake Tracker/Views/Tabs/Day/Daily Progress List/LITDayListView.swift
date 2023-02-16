//
//  LITDayListView.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/6/23.
//

import SwiftUI

struct LITDayListView: View {
    let dayParts = [
        LITTimeOfDayList(dayPart: DayPart.morning.name),
        LITTimeOfDayList(dayPart: DayPart.afternoon.name),
        LITTimeOfDayList(dayPart: DayPart.evening.name),
        LITTimeOfDayList(dayPart: DayPart.night.name),
    ]
    
    var body: some View {        
        NavigationStack {
            List(dayParts, id: \.self) { dayPart in
                dayPart
            }
        }
    }
}

struct LITDayListView_Previews: PreviewProvider {
    static var previews: some View {
        LITDayListView()
    }
}
