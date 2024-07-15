//
//  ContentView.swift
//  GamePowerGiveaways
//
//  Created by Mohamed Gamal on 12/07/2024.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    let store: Store<GiveawayState, GiveawayAction>
    @StateObject var coordinator = NavigationViewCoordinator()
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            NavigationView {
                VStack(alignment: .leading, spacing: 0) {
                    HeaderView()
                    
                    Spacer().frame(height: 24) // Add 24 points of space
                    
                    EpicGamesGiveawaysView(viewModel: GiveawaysViewModel(store: store))
                    
                    Spacer().frame(height: 20) // Add 20 points of space between carousel and list
                    
                    GiveawaysListView(viewModel: GiveawaysViewModel(store: store))
                }
                .alert(
                    isPresented: Binding<Bool>(
                        get: { viewStore.alert != nil },
                        set: { _ in viewStore.send(.dismissAlert) }
                    )
                ) {
                    Alert(
                        title: Text(viewStore.alert ?? "Error")
                    )
                }
                .sheet(isPresented: $coordinator.isDetailPresented) {
                    if let selectedGiveaway = coordinator.selectedGiveaway {
                        GiveawayDetailView(giveaway: selectedGiveaway)
                    }
                }
            }
            .environmentObject(coordinator)
            .edgesIgnoringSafeArea(.top) // Ensure the content goes to the top edge
        }
    }
}

#Preview {
    ContentView(store: Store(
        initialState: GiveawayState(),
        reducer: giveawayReducer,
        environment: GiveawayEnvironment(
            apiClient: MoyaAPIClient(),
            mainQueue: DispatchQueue.main.eraseToAnyScheduler()
        )
    ))
}
