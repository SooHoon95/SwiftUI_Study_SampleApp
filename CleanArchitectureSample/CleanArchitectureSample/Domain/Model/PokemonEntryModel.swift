//
//  PokemonEntryModel.swift
//  CleanArchitectureSample
//
//  Created by 최수훈 on 1/29/25.
//

import Foundation

struct PokemonEntryModel: Decodable {
    var id: UUID = .init()
    let name: String
    let url: String

    var imageUrl: String {
    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(url.split(separator: "/").last ?? "1").png"
     
    }
  
  
}
