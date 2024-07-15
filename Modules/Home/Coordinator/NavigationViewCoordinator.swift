//
//  NavigationViewCoordinator.swift
//  GamePowerGiveaways
//
//  Created by Mohamed Gamal on 15/07/2024.
//

import SwiftUI
import Combine

final class NavigationViewCoordinator: ObservableObject {
    @Published var selectedGiveaway: Giveaway? = nil
    @Published var isDetailPresented: Bool = false
    
    func navigate(to giveaway: Giveaway) {
        self.selectedGiveaway = giveaway
        self.isDetailPresented = true
    }
}
