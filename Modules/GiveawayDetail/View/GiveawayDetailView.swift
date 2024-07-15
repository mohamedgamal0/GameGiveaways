//
//  GiveawayDetailView.swift
//  GamePowerGiveaways
//
//  Created by Mohamed Gamal on 15/07/2024.
//

import SwiftUI
import Kingfisher

struct GiveawayDetailView: View {
    let giveaway: Giveaway
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isLiked = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ZStack(alignment: .topLeading) {
                    KFImage(URL(string: giveaway.image))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                        .clipped()
                    
                    VStack {
                        HStack {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.black.opacity(0.5))
                                    .clipShape(Circle())
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                isLiked.toggle()
                            }) {
                                Image(systemName: isLiked ? "heart.fill" : "heart")
                                    .foregroundColor(isLiked ? .red : .white)
                                    .padding()
                                    .background(Color.black.opacity(0.5))
                                    .clipShape(Circle())
                            }
                        }
                        .padding([.top, .horizontal], 16)
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(giveaway.title)
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding([.leading, .trailing, .bottom], 8)
                            
                            HStack {
                                Spacer()
                                
                                Button(action: {
                                    // Add your open giveaway action here
                                }) {
                                    Text("Get it")
                                        .font(.subheadline)
                                        .foregroundColor(.black)
                                        .padding(8)
                                        .background(Color.white)
                                        .cornerRadius(8)
                                }
                            }
                            .padding([.leading, .trailing, .bottom], 8)
                        }
                        .background(Color.black.opacity(0.6))
                        .cornerRadius(10)
                        .padding([.leading, .trailing, .bottom], 16)
                    }
                    .frame(height: 300)
                }
                
                HStack(spacing: 0) {
                    VStack {
                        Image(systemName: "dollarsign.circle")
                            .font(.system(size: 30))
                        Text("\(giveaway.worth)")
                            .font(.subheadline)
                    }
                    .frame(maxWidth: .infinity)
                    
                    Divider()
                    
                    VStack {
                        Image(systemName: "person.3")
                            .font(.system(size: 30))
                        Text("\(giveaway.users)")
                            .font(.subheadline)
                    }
                    .frame(maxWidth: .infinity)
                    
                    Divider()
                    
                    VStack {
                        Image(systemName: "gamecontroller")
                            .font(.system(size: 30))
                        Text("\(giveaway.platforms)")
                            .font(.subheadline)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding([.leading, .trailing])
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Platforms")
                        .font(.headline)
                    Text(giveaway.platforms)
                        .font(.subheadline)
                    
                    Text("Giveaway End Date")
                        .font(.headline)
                    Text(giveaway.endDate)
                        .font(.subheadline)
                    
                    Text("Description")
                        .font(.headline)
                        .padding(.top)
                    
                    Text(giveaway.description)
                        .font(.body)
                }
                .padding([.leading, .trailing])
                .padding(.bottom, 20)
            }
        }
        .navigationTitle(giveaway.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct GiveawayDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GiveawayDetailView(giveaway: Giveaway(
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
    }
}
