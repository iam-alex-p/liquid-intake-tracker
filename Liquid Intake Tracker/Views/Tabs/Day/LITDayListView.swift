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
            Section(header: Label("Morning", systemImage: "sunrise")) {
                
            }
            
            Section(header: Label("Afternoon", systemImage: "sun.min")) {
                
            }
            
            Section(header: Label("Evening", systemImage: "sunset")) {
                
            }
            
            Section(header: Label("Night", systemImage: "moon")) {
                
            }
        }
        .listStyle(.insetGrouped)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                }
                
            }
        }
    }
}

struct LITDayListView_Previews: PreviewProvider {
    static var previews: some View {
        LITDayListView()
    }
}
