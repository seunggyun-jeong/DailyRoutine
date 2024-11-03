//
//  CircleView.swift
//  GlanceDailyRoutine
//
//  Created by Gyunni on 10/16/24.
//

import SwiftUI

struct CircleView: View {
    var body: some View {
        GeometryReader { geometry in
            let radius = min(geometry.size.width, geometry.size.height) / 2
            
            ZStack {
                Circle()
                    .stroke(.gray, lineWidth: 4)
                
                // 취침 섹션 (빨간색)
                PieSlice(startAngle: .degrees(0), endAngle: .degrees(120))
                    .fill(Color.red)
                
                // 배드민턴 섹션 (초록색)
                PieSlice(startAngle: .degrees(120), endAngle: .degrees(240))
                    .fill(Color.green)
                
                // 팀 프로젝트 섹션 (민트색)
                PieSlice(startAngle: .degrees(240), endAngle: .degrees(300))
                    .fill(Color.mint)
                
                // 영어 공부 섹션 (보라색)
                PieSlice(startAngle: .degrees(300), endAngle: .degrees(360))
                    .fill(Color.purple)
                
                // 시간 텍스트
                TimeLabels(radius: radius)
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

struct TimeLabels: View {
    let radius: CGFloat
    
    var body: some View {
        ZStack {
            // 시간 레이블
            ForEach([
                (text: "24", angle: 270),
                (text: "6", angle: 0),
                (text: "12", angle: 90),
                (text: "18", angle: 180)
            ], id: \.text) { item in
                Text(item.text)
                    .position(
                        x: radius + cos(Double(item.angle) * .pi / 180) * (radius + 20),
                        y: radius + sin(Double(item.angle) * .pi / 180) * (radius + 20)
                    )
            }
            
            // 활동 레이블
            ForEach([
                (text: "취침", angle: 60, offset: 0.7),
                (text: "배드민턴", angle: 180, offset: 0.6),
                (text: "팀 프로젝트", angle: 270, offset: 0.6),
                (text: "영어 공부", angle: 330, offset: 0.7)
            ], id: \.text) { item in
                Text(item.text)
                    .foregroundColor(.white)
                    .position(
                        x: radius + cos(Double(item.angle) * .pi / 180) * (radius * item.offset),
                        y: radius + sin(Double(item.angle) * .pi / 180) * (radius * item.offset)
                    )
            }
        }
    }
}
struct PieSlice: Shape {
    var startAngle: Angle
    var endAngle: Angle
    
    func path(in rect: CGRect) -> Path {
        var path: Path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        
        path.move(to: center)
        path.addArc(center: center,
                   radius: radius,
                   startAngle: startAngle - .degrees(90),
                   endAngle: endAngle - .degrees(90),
                   clockwise: false)
        path.closeSubpath()
        
        return path
    }
}
#Preview {
    CircleView()
}
