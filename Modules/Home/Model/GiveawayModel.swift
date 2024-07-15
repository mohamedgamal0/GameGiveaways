//
//  GiveawayModel.swift
//  GamePowerGiveaways
//
//  Created by Mohamed Gamal on 12/07/2024.
//

import Foundation

struct Giveaway: Codable, Identifiable, Equatable {
    let id: Int
    let title, worth: String
    let thumbnail, image: String
    let description, instructions: String
    let openGiveawayURL: String
    let publishedDate: String
    let platforms, endDate: String
    let users: Int
    let gamerpowerURL, openGiveaway: String
    var isFavorite: Bool = false

    enum CodingKeys: String, CodingKey {
        case id, title, worth, thumbnail, image, description, instructions
        case openGiveawayURL = "open_giveaway_url"
        case publishedDate = "published_date"
        case platforms
        case endDate = "end_date"
        case users
        case gamerpowerURL = "gamerpower_url"
        case openGiveaway = "open_giveaway"
    }
}
