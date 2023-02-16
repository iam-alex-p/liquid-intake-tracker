//
//  LITGreetingView.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/6/23.
//

import SwiftUI

struct LITGreetingView: View {
    @State private var dayPart = ""
    var name = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Good \(self.dayPart),")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .onAppear {
                    self.dayPart = Date().dayPart
                }
            Text(name)
                .font(.title)
                .fontWeight(.semibold)
                .opacity(0.7)
        }
    }
}

struct LITGreetingView_Previews: PreviewProvider {
    static var previews: some View {
        LITGreetingView()
    }
}
