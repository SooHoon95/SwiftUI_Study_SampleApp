//
//  Injection.swift
//  CleanArchitectureSample
//
//  Created by 최수훈 on 1/29/25.
//

import Foundation

struct Injection{
    
    private init(){}
    
    static let shared: Injection = Injection()
    
    private func provideRepository() -> PokemonRepositoryProtocol {
        let remote: RemoteDataSource = RemoteDataSource.shared
        return PokemonRepositoryImpl.sharedInstance(remote)
    }
    
    func provideGetPokemonsUseCase() -> GetPokemonsUseCase {
        GetPokemonsUseImpl(repo: provideRepository())
    }
    
    func provideGetPokemonDetailUseCase() -> GetPokemonDetailUseCase {
        GetPokemonDetailImpl(repo: provideRepository())
    }
}
