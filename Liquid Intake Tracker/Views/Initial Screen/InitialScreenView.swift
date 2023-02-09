//
//  InitialScreenView.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/7/23.
//

import SwiftUI

struct InitialScreenView: View {
    @State private var isShowingTabView = false
    
    var body: some View {
        VStack {
            if isShowingTabView {
                LITTabView()
            } else {
                Button("Save") {
                    isShowingTabView.toggle()
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            }
        }
    }
}

struct InitialScreenView_Previews: PreviewProvider {
    static var previews: some View {
        InitialScreenView()
    }
}
