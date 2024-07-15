//
//  GiveawaysState.swift
//  GamePowerGiveaways
//
//  Created by Mohamed Gamal on 13/07/2024.
//

import ComposableArchitecture
import Combine

struct GiveawayState: Equatable {
    var giveaways: [Giveaway] = []
    var epicGiveaways: [Giveaway] = []
    var isLoading: Bool = false
    var alert: String?
}
