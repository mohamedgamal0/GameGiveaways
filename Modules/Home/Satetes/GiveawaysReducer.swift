//
//  GiveawaysReducer.swift
//  GamePowerGiveaways
//
//  Created by Mohamed Gamal on 13/07/2024.
//

import Foundation
import ComposableArchitecture
import Combine

let giveawayReducer = Reducer<GiveawayState, GiveawayAction, GiveawayEnvironment> { state, action, environment in
    switch action {
    case .fetchGiveaways:
        state.isLoading = true
        return environment.apiClient
            .performRequest(request: APIRequests.allGiveaways)
            .receive(on: environment.mainQueue)
            .catchToEffect()
            .map(GiveawayAction.giveawaysResponse)
    
    case .fetchEpicGiveaways:
        state.isLoading = true
        return environment.apiClient
            .performRequest(request: APIRequests.giveawaysByPlatform("epic-games-store"))
            .receive(on: environment.mainQueue)
            .catchToEffect()
            .map(GiveawayAction.epicGiveawaysResponse)
    
    case .fetchGiveawaysByPlatform(let platform):
        state.isLoading = true
        return environment.apiClient
            .performRequest(request: APIRequests.giveawaysByPlatform(platform))
            .receive(on: environment.mainQueue)
            .catchToEffect()
            .map(GiveawayAction.giveawaysResponse)
    
    case .giveawaysResponse(let result):
        state.isLoading = false
        switch result {
        case .success(let giveaways):
            state.giveaways = giveaways
        case .failure(let error):
            state.alert = error.localizedDescription
        }
        return .none

    case .epicGiveawaysResponse(let result):
        state.isLoading = false
        switch result {
        case .success(let giveaways):
            state.epicGiveaways = giveaways
        case .failure(let error):
            state.alert = error.localizedDescription
        }
        return .none
    
    case .dismissAlert:
        state.alert = nil
        return .none
    }
}
