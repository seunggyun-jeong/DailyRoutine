//
//  ContentView.swift
//  GlanceDailyRoutine
//
//  Created by Gyunni on 10/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CircleView()
                .padding(.bottom, 50)

            Divider()
                .padding(.bottom, 50)

            InputView()
                .padding(.bottom, 50)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
