//
//  GiveawaysEnvironment.swift
//  GamePowerGiveaways
//
//  Created by Mohamed Gamal on 13/07/2024.
//

import Foundation
import ComposableArchitecture
import Combine

struct GiveawayEnvironment {
    var apiClient: APIClient
    var mainQueue: AnySchedulerOf<DispatchQueue>
}
