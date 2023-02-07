//
//  LITGreetingView.swift
//  Liquid Intake Tracker
//
//  Created by Aleksei Pokolev on 2/6/23.
//

import SwiftUI

struct LITGreetingView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Welcome back,")
                .font(.largeTitle)
                .fontWeight(.heavy)
            Text("ALEKSEI")
                .font(.title)
                .fontWeight(.semibold)
                .opacity(0.7)
            
            GreetingSubView()
                .padding(.top, 10)
        }
    }
}

struct GreetingSubView: View {
    var body: some View {
        Text("That is how you\nday is going so far")
            .font(.headline)
            .fontWeight(.bold)
    }
}

struct LITGreetingView_Previews: PreviewProvider {
    static var previews: some View {
        LITGreetingView()
    }
}
