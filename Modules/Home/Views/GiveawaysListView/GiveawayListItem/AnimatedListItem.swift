//
//  AnimatedListItem.swift
//  GamePowerGiveaways
//
//  Created by Mohamed Gamal on 14/07/2024.
//

import SwiftUI

struct AnimatedListItem: View {
    let giveaway: Giveaway
    @EnvironmentObject var coordinator: NavigationViewCoordinator
    
    var body: some View {
        GeometryReader { geometry in
            let midX = geometry.frame(in: .global).midX
            let screenWidth = UIScreen.main.bounds.width
            let scale = 1 - abs(midX - screenWidth / 2) / screenWidth
            
            Button(action: {
                coordinator.navigate(to: giveaway)
            }) {
                GiveawayListItem(giveaway: giveaway)
                    .scaleEffect(max(0.8, scale))
                    .opacity(Double(max(0.5, scale)))
                    .animation(.easeInOut(duration: 0.5))
            }
        }
        .frame(height: 300)
    }
}
