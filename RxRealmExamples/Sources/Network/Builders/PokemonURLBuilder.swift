struct PokemonURLBuilder: APIURLBuilder {
    var host: String { return "pokeapi.co" }
    var root: String { return "api" }
    var version: String { return "v2" }
}
