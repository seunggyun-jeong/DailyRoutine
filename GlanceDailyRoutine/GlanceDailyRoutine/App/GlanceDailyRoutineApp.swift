//
//  GlanceDailyRoutineApp.swift
//  GlanceDailyRoutine
//
//  Created by Gyunni on 10/16/24.
//

import SwiftUI

@main
struct GlanceDailyRoutineApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ForEach(Weekday.allCases, id: \.self) { weekday in
                    Tab(weekday.shortName, systemImage: "circle.fill") {
                        ContentView()
                    }
                }
            }
        }
    }
}
