//
//  GetPokemonDetail.swift
//  CleanArchitectureSample
//
//  Created by 최수훈 on 1/29/25.
//

import Foundation

protocol GetPokemonDetailUseCase {
  func execute(url: String) async throws -> Result<PokemonModel, Error>
}

struct GetPokemonDetailImpl: GetPokemonDetailUseCase {
  let repo: PokemonRepositoryProtocol
  
  func execute(url: String) async throws -> Result<PokemonModel, Error> {
    do {
      let pokemons = try await repo.getPokemonDetail(url: url)
      return .success(pokemons)
    } catch {
      return .failure(error)
    }
  }
}
