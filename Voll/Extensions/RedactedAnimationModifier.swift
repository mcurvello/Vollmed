//
//  RedactedAnimationModifier.swift
//  Voll
//
//  Created by Marcio Curvello on 22/01/24.
//

import SwiftUI

struct RedactedAnimationModifier: ViewModifier {
    
    @State private var isRedacted = true
    
    func body(content: Content) -> some View {
        content
            .opacity(isRedacted ? 0 : 1)
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 0.7).repeatForever(autoreverses: true)) {
                    self.isRedacted.toggle()
                }
            }
    }
}

extension View {
    func redactedAnimation() -> some View {
        modifier(RedactedAnimationModifier())
    }
}
