//
//  LITDayProgressBarView.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/6/23.
//

import SwiftUI

struct LITDayProgressBarView: View {
    var body: some View {
        Circle()
            .stroke(
                .blue.gradient.opacity(0.7),
                lineWidth: 15
            )
            .frame(width: 200, height: 200)
    }
}

struct LITDayProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        LITDayProgressBarView()
    }
}
