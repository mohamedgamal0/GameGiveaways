//
//  GiveawaysListView.swift
//  GamePowerGiveaways
//
//  Created by Mohamed Gamal on 14/07/2024.
//

import SwiftUI
import ComposableArchitecture

struct GiveawaysListView: View {
    @ObservedObject var viewModel: GiveawaysViewModel
    @EnvironmentObject var coordinator: NavigationViewCoordinator
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.giveaways) { giveaway in
                    Button(action: {
                        coordinator.navigate(to: giveaway)
                    }) {
                        GiveawayListItem(giveaway: giveaway)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.vertical, 10)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct GiveawaysListView_Previews: PreviewProvider {
    static var previews: some View {
        GiveawaysListView(viewModel: GiveawaysViewModel(store: Store(
            initialState: GiveawayState(),
            reducer: giveawayReducer,
            environment: GiveawayEnvironment(
                apiClient: MoyaAPIClient(),
                mainQueue: DispatchQueue.main.eraseToAnyScheduler()
            )
        )))
    }
}
