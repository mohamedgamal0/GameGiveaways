//
//  MoyaAPIClient.swift
//  GamePowerGiveaways
//
//  Created by Mohamed Gamal on 12/07/2024.
//

import Foundation
import Combine
import Moya
import CombineMoya

final class MoyaAPIClient: APIClient {
    private let provider: MoyaProvider<MultiTarget>
    
    init(provider: MoyaProvider<MultiTarget> = MoyaProvider<MultiTarget>()) {
        self.provider = provider
    }
    
    func performRequest<T: Decodable>(request: APIRequest) -> AnyPublisher<T, APIError> {
        let target = MultiTarget(GamerPowerAPITarget(request: request))
        return provider.requestPublisher(target)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                switch error {
                case is DecodingError:
                    return .decodingError(error)
                default:
                    return .networkError(error)
                }
            }
            .eraseToAnyPublisher()
    }
}

