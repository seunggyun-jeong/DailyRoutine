//
//  PieSlice.swift
//  GlanceDailyRoutine
//
//  Created by Gyunni on 11/4/24.
//

import SwiftUI
import CoreGraphics

struct PieSlice: Shape {
    private(set) var startTime: Double
    private(set) var endTime: Double

    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(startTime, endTime)
        }
        set {
            startTime = newValue.first
            endTime = newValue.second
        }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = rect.width / 2

        let startAngle = Angle(degrees: startTime * 15 - 90)
        let endAngle = Angle(degrees: endTime * 15 - 90)

        path.move(to: center)
        path.addLine(to: CGPoint(
            x: center.x + radius * cos(startAngle.radians),
            y: center.y + radius * sin(startAngle.radians)
        ))
        path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)

        return path
    }
}

#Preview {
    PieSlice(startTime: 6, endTime: 18)
        .frame(width: 300)
}
