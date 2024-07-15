//
//  GamerPowerAPITarget.swift
//  GamePowerGiveaways
//
//  Created by Mohamed Gamal on 13/07/2024.
//

import Foundation
import CombineMoya
import Moya

struct GamerPowerAPITarget: TargetType {
    let request: APIRequest
    
    var baseURL: URL {
        return URL(string: "https://www.gamerpower.com/api")!
    }
    
    var path: String {
        return request.endpoint
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        if let parameters = request.parameters {
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        } else {
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
