//
//  EpicGamesGiveawaysView.swift
//  GamePowerGiveaways
//
//  Created by Mohamed Gamal on 13/07/2024.
//

import SwiftUI
import ComposableArchitecture

struct EpicGamesGiveawaysView: View {
    @ObservedObject var viewModel: GiveawaysViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            if viewModel.isLoading {
                GeometryReader { geometry in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 40) {
                            ForEach(0..<3) { _ in
                                SkeletonView()
                                    .frame(width: 350, height: 200)
                                    .shimmering()
                            }
                        }
                        .padding(.horizontal, (geometry.size.width - 350) / 2)
                    }
                }
                .frame(height: 220)
            } else if !viewModel.epicGiveaways.isEmpty {
                GeometryReader { geometry in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 40) {
                            ForEach(viewModel.epicGiveaways) { giveaway in
                                GeometryReader { itemGeometry in
                                    CarouselItem(giveaway: giveaway)
                                        .shadow(radius: 5, x: 5, y: 5)
                                        .rotation3DEffect(
                                            .degrees(getRotationAngle(proxy: itemGeometry, geometry: geometry)),
                                            axis: (x: 0, y: 1, z: 0)
                                        )
                                        .scaleEffect(getScale(proxy: itemGeometry, geometry: geometry))
                                        .animation(.easeInOut(duration: 0.5))
                                }
                                .frame(width: 350, height: 200)
                            }
                        }
                        .padding(.horizontal, (geometry.size.width - 350) / 2)
                    }
                }
                .frame(height: 220)
            } else {
                Text("No giveaways available.")
                    .padding()
            }
        }
        .onAppear {
            viewModel.fetchGiveaways()
            viewModel.fetchEpicGiveaways()
        }
    }
    
    private func getRotationAngle(proxy: GeometryProxy, geometry: GeometryProxy) -> Double {
        let midX = proxy.frame(in: .global).midX
        let width = geometry.size.width
        let angle = (midX - width / 2) / width * 30
        return Double(angle)
    }
    
    private func getScale(proxy: GeometryProxy, geometry: GeometryProxy) -> CGFloat {
        let midX = proxy.frame(in: .global).midX
        let width = geometry.size.width
        let scale = max(0.7, 1 - abs(midX - width / 2) / (width / 2))
        return scale
    }
}
