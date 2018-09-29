import RxSwift

protocol PokemonsService {

    /// Obtains pokemons
    ///
    /// - Returns: Observable with array of pokemons
    func getPokemon(withId id: Int) -> Single<Pokemon>
}
