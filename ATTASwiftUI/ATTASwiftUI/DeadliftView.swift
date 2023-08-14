//
//  KeyView.swift
//  ATTASwiftUI
//
//  Created by Jacob Bartlett on 12/08/2023.
//

import SwiftUI

struct DeadliftView: View {
    
    struct Transformation {
        var yScale = 1.0
        var yTranslation = 0.0
    }
    
    var body: some View {
        Image(systemName: "figure.strengthtraining.traditional")
            .resizable()
            .foregroundStyle(.white)
            .frame(width: 200, height: 200)
            .keyframeAnimator(initialValue: Transformation(),
                              repeating: true,
                              content: { content, transformation in
                content
                    .scaleEffect(y: transformation.yScale, anchor: .bottom)
                    .offset(y: transformation.yTranslation)
            },
                              keyframes: { _ in
                KeyframeTrack(\.yScale) {
                    LinearKeyframe(0.5, duration: 0.25)
                    LinearKeyframe(1.0, duration: 0.25)
                    LinearKeyframe(1.3, duration: 0.25)
                    LinearKeyframe(1.0, duration: 0.25)
                }
                KeyframeTrack(\.yTranslation) {
                    LinearKeyframe(20, duration: 0.25)
                    SpringKeyframe(-40, duration: 0.5, spring: .snappy)
                    CubicKeyframe(0, duration: 0.25)
                }
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(Color.indigo)
    }
}

#Preview {
    DeadliftView()
}
