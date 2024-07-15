//
//  GamePowerGiveawaysApp.swift
//  GamePowerGiveaways
//
//  Created by Mohamed Gamal on 12/07/2024.
//

import SwiftUI
import ComposableArchitecture

@main
struct GamePowerGiveawaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store(
                initialState: GiveawayState(),
                reducer: giveawayReducer,
                environment: GiveawayEnvironment(
                    apiClient: MoyaAPIClient(),
                    mainQueue: DispatchQueue.main.eraseToAnyScheduler()
                )
            ))
        }
    }
}
