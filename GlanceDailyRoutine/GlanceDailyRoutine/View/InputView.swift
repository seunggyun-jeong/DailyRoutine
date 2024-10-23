//
//  InputView.swift
//  GlanceDailyRoutine
//
//  Created by Gyunni on 10/16/24.
//

import SwiftUI

struct InputView: View {
    @State var routineName: String = ""
    @State var startTime: Date = .now
    @State var endTime: Date = .now

    var body: some View {
        HStack {
            DatePicker("시작 시간", selection: $startTime, displayedComponents: [.hourAndMinute])
                .datePickerStyle(.stepperField)
            DatePicker("종료 시간", selection: $endTime, displayedComponents: [.hourAndMinute])
            TextField("일정 이름", text: $routineName)

            Button {
                // submit
            } label: {
                Image(systemName: "plus.circle.fill")
            }
        }
    }
}

#Preview {
    InputView()
}
