//
//  APIRequests.swift
//  GamePowerGiveaways
//
//  Created by Mohamed Gamal on 13/07/2024.
//

import Foundation

enum APIRequests {
    static let allGiveaways = APIRequest(endpoint: "/giveaways", parameters: nil)
    static func giveawaysByPlatform(_ platform: String) -> APIRequest {
        return APIRequest(endpoint: "/giveaways", parameters: ["platform": platform])
    }
}
