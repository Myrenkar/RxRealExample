import Foundation
import RxSwift

final class APIPokemonsService: PokemonsService {

    // MARK: - Properties

    private let apiClient: APIClient

    // MARK: - Init

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    // MARK: - PokemonsService

    func getPokemon(withId id: Int) -> Single<Pokemon> {
        return apiClient.perform(request: PokemonRequest(id: id))
            .filter { $0.data != nil }
            .map { try JSONDecoder().decode(Pokemon.self, from: $0.data!) }
            .asObservable()
            .asSingle()
    }
}
