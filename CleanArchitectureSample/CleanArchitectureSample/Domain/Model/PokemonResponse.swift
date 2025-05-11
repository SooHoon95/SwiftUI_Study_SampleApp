//
//  PokemonResponse.swift
//  CleanArchitectureSample
//
//  Created by 최수훈 on 1/29/25.
//

import Foundation

struct PokemonResponse: Decodable {
  let count: Int?
  let results: [PokemonEntryModel]?
}

struct PokemonEntryResponse: Decodable {
  let name: String?
  let url: String?
}
