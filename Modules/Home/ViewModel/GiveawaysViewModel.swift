//
//  GiveawaysViewModel.swift
//  GamePowerGiveaways
//
//  Created by Mohamed Gamal on 13/07/2024.
//

import SwiftUI
import Combine
import ComposableArchitecture

final class GiveawaysViewModel: ObservableObject {
    @Published var giveaways: [Giveaway] = []
    @Published var epicGiveaways: [Giveaway] = []
    @Published var isLoading: Bool = false
    @Published var alert: String?
    
    private var cancellables: Set<AnyCancellable> = []
    private let store: Store<GiveawayState, GiveawayAction>
    private let viewStore: ViewStore<GiveawayState, GiveawayAction>
    
    init(store: Store<GiveawayState, GiveawayAction>) {
        self.store = store
        self.viewStore = ViewStore(store)
        
        viewStore.publisher.giveaways
            .assign(to: &$giveaways)
        viewStore.publisher.epicGiveaways
            .assign(to: &$epicGiveaways)
        viewStore.publisher.isLoading
            .assign(to: &$isLoading)
        viewStore.publisher.alert
            .assign(to: &$alert)
    }
    
    func fetchGiveaways() {
        viewStore.send(.fetchGiveaways)
    }
    
    func fetchEpicGiveaways() {
        viewStore.send(.fetchEpicGiveaways)
    }
    
    func dismissAlert() {
        viewStore.send(.dismissAlert)
    }
}

