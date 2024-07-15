//
//  GiveawaysAction.swift
//  GamePowerGiveaways
//
//  Created by Mohamed Gamal on 13/07/2024.
//

import ComposableArchitecture

enum GiveawayAction: Equatable {
    case fetchGiveaways
    case fetchEpicGiveaways
    case fetchGiveawaysByPlatform(String)
    case giveawaysResponse(Result<[Giveaway], APIError>)
    case epicGiveawaysResponse(Result<[Giveaway], APIError>)
    case dismissAlert
}
