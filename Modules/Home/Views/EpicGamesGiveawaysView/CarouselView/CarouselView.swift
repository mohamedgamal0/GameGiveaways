//
//  CarouselView.swift
//  GamePowerGiveaways
//
//  Created by Mohamed Gamal on 13/07/2024.
//

import SwiftUI

struct CarouselView: View {
    let giveaways: [Giveaway]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 25) {
                ForEach(giveaways) { giveaway in
                    CarouselItem(giveaway: giveaway)
                }
            }
            .padding(.horizontal)
        }
        .frame(height: 220)
    }
}
