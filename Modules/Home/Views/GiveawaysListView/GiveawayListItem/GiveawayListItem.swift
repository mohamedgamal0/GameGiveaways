//
//  GiveawayListItem.swift
//  GamePowerGiveaways
//
//  Created by Mohamed Gamal on 14/07/2024.
//

import SwiftUI
import Kingfisher


struct GiveawayListItem: View {
    @State private var isFavorite: Bool
    let giveaway: Giveaway
    
    init(giveaway: Giveaway) {
        self.giveaway = giveaway
        _isFavorite = State(initialValue: UserDefaults.standard.bool(forKey: "\(giveaway.id)_favorite"))
    }
    
    var body: some View {
        ZStack {
            KFImage(URL(string: giveaway.image))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width - 40, height: 300) // Updated height
                .clipped()
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(giveaway.title)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding([.leading, .trailing, .top], 8)
                    
                    Spacer()
                    
                    Button(action: {
                        isFavorite.toggle()
                        UserDefaults.standard.set(isFavorite, forKey: "\(giveaway.id)_favorite")
                    }) {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(isFavorite ? .red : .white)
                            .padding()
                    }
                }
                
                Text(giveaway.platforms)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding([.leading, .trailing])
                
                Spacer()
                
                Text(giveaway.description)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .lineLimit(3) // Adjust the line limit as needed
                    .padding([.leading, .trailing, .bottom], 8)
            }
            .frame(width: UIScreen.main.bounds.width - 40, height: 300) // Updated height
            .background(Color.black.opacity(0.6))
            .cornerRadius(10)
        }
        .frame(width: UIScreen.main.bounds.width - 40, height: 300) // Updated height
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct GiveawayListItem_Previews: PreviewProvider {
    static var previews: some View {
        GiveawayListItem(giveaway: Giveaway(
            id: 1,
            title: "ReX (IndieGala) Giveaway",
            worth: "$20",
            thumbnail: "https://example.com/thumbnail.jpg",
            image: "https://example.com/image.jpg",
            description: "Score ReX for free on IndieGala! ReX is a indie 2D platformer shooter where you play as a mercenary soldier hired by rex corps.",
            instructions: "Follow the instructions to get the giveaway.",
            openGiveawayURL: "https://example.com/giveaway",
            publishedDate: "2023-07-14",
            platforms: "PC, DRM-Free",
            endDate: "2024-10-14",
            users: 1000,
            gamerpowerURL: "https://example.com/gamerpower",
            openGiveaway: "https://example.com/open_giveaway"
        ))
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
