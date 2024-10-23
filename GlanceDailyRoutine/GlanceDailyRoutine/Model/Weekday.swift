//
//  Weekday.swift
//  GlanceDailyRoutine
//
//  Created by Gyunni on 10/16/24.
//

enum Weekday: CaseIterable {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday

    var shortName: String {
        switch self {
        case .sunday:
            "Sun."
        case .monday:
            "Mon."
        case .tuesday:
            "Tue."
        case .wednesday:
            "Wed."
        case .thursday:
            "Thu."
        case .friday:
            "Fri."
        case .saturday:
            "Sat."
        }
    }
}
