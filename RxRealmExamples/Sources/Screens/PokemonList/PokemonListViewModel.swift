import RxSwift
import RealmSwift
import RxRealm

protocol PokemonListViewModelProtocol {
    func fetchPokemons()
    var pokemons: Observable<RealmSwift.Results<Pokemon>> { get }
}

final class PokemonListViewModel: PokemonListViewModelProtocol {

    // MARK: Properties

    private let pokemonsService: PokemonsService
    private let realm: Realm
    private let disposeBag = DisposeBag()

    // MARK: Initialization

    init(pokemonsService: PokemonsService, realm: Realm) {
        self.pokemonsService = pokemonsService
        self.realm = realm
    }

    // MARK: PokemonListViewModelProtocol

    func fetchPokemons() {
        pokemonsService.getPokemon(withId: randomInt)
            .asObservable()
            .subscribe(Realm.rx.add(configuration: realm.configuration, update: true, onError: nil))
            .disposed(by: disposeBag)
    }

    var pokemons: Observable<Results<Pokemon>> {
        return Observable.collection(from: realm.objects(Pokemon.self), synchronousStart: true)
    }

    var randomInt: Int {
        return Int.random(in: 1..<949)
    }
}
