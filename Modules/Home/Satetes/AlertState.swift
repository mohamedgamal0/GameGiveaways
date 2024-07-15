//
//  AlertState.swift
//  GamePowerGiveaways
//
//  Created by Mohamed Gamal on 14/07/2024.
//

import Foundation
import ComposableArchitecture
import Combine

struct AlertState: Identifiable, Equatable {
    var id: UUID = UUID()
    var message: String
}
