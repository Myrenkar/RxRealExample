import UIKit

final class ApplicationController {

    init(dependencies: ApplicationDependenciesProvider) {
        self.dependencies = dependencies
    }

    private let dependencies: ApplicationDependenciesProvider

    private(set) lazy var rootViewController: UINavigationController = {
        let viewController = PokemonListViewController(
            layoutProvider: dependencies.flowLayoutProvider,
            viewModel: PokemonListViewModel(
                pokemonsService: dependencies.pokemonService,
                realm: dependencies.realm
            )
        )
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }()
    
}
