//
//  APICall.swift
//  CleanArchitectureSample
//
//  Created by 최수훈 on 1/29/25.
//

import Foundation

struct API {
    static let baseUrl = "https://pokeapi.co/api/v2/"
}

protocol Endpoint {
    var url: String { get }
}

enum Endpoints {
    enum Gets: Endpoint {
      case pokemons(offset: Int, limit : Int)
        
        
        public var url: String {
            switch self {
                case .pokemons(let offset, let limit): return "\(API.baseUrl)pokemon?offset=\(offset)&limit=\(limit)"
            }
        }
    }
    
}
