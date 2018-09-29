import Foundation

struct PokemonRequest: APIRequest {

    // MARK: - Properties

    private let id: Int

    // MARK: - Initialization

    init(id: Int) {
        self.id = id
    }

    // MARK: - APIRequest

    var path: String { return "pokemon/\(id)" }
}
