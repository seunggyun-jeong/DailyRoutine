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
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    CircleView()
}
