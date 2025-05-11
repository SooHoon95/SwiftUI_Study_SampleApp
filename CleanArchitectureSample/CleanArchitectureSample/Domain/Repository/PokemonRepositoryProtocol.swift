//
//  PokemonRepositoryProtocol.swift
//  CleanArchitectureSample
//
//  Created by 최수훈 on 1/29/25.
//

import Foundation

protocol PokemonRepositoryProtocol {
  func getPokemons(offset: Int, limit: Int) async throws -> [PokemonEntryModel]
  func getPokemonDetail(url: String) async throws -> PokemonModel
}
