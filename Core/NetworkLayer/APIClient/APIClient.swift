//
//  APIClient.swift
//  GamePowerGiveaways
//
//  Created by Mohamed Gamal on 12/07/2024.
//

import Combine

protocol APIClient {
    func performRequest<T: Decodable>(request: APIRequest) -> AnyPublisher<T, APIError>
}
