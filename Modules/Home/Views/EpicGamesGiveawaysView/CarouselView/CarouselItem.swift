//
//  CarouselItem.swift
//  GamePowerGiveaways
//
//  Created by Mohamed Gamal on 13/07/2024.
//

import SwiftUI
import Kingfisher

struct CarouselItem: View {
    let giveaway: Giveaway
    
    var body: some View {
        ZStack {
            KFImage(URL(string: giveaway.image))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 350, height: 200)
                .clipped()
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(giveaway.title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding([.leading, .trailing, .top], 8)
                
                Spacer()
                
                Text(giveaway.description)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .padding([.leading, .trailing, .bottom], 8)
            }
            .frame(width: 350, height: 200)
            .background(Color.black.opacity(0.6))
            .cornerRadius(10)
        }
        .frame(width: 350, height: 200)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct CarouselItem_Previews: PreviewProvider {
    static var previews: some View {
        CarouselItem(giveaway: Giveaway(
            id: 1,
            title: "LISA: The Definitive Edition (Epic Games) Giveaway",
            worth: "$20",
            thumbnail: "https://example.com/thumbnail.jpg",
            image: "https://example.com/image.jpg",
            description: "Score LISA: The Definitive Edition for free on Epic Games Store and unlock the original narrative-driven RPG LISA.",
            instructions: "Follow the instructions to get the giveaway.",
            openGiveawayURL: "https://example.com/giveaway",
            publishedDate: "2023-07-14",
            platforms: "epic-games-store",
            endDate: "2024-10-14",
            users: 1000,
            gamerpowerURL: "https://example.com/gamerpower",
            openGiveaway: "https://example.com/open_giveaway"
        ))
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
