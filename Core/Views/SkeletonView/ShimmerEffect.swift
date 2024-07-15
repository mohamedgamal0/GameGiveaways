//
//  ShimmerEffect.swift
//  GamePowerGiveaways
//
//  Created by Mohamed Gamal on 14/07/2024.
//

import SwiftUI

struct ShimmerEffect: ViewModifier {
    @State private var phase: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .overlay(
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: Color.white.opacity(0.6), location: phase),
                        .init(color: Color.white.opacity(0.2), location: phase + 0.1),
                        .init(color: Color.white.opacity(0.6), location: phase + 0.2)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false))
                .mask(content)
            )
            .onAppear {
                withAnimation {
                    phase = 1.0
                }
            }
            .transition(.opacity.combined(with: .scale))
    }
}

extension View {
    func shimmering() -> some View {
        self.modifier(ShimmerEffect())
    }
}
