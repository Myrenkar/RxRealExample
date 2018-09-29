import RealmSwift

/// Describes a type that is providing application dependencies.
protocol ApplicationDependenciesProvider {
    var apiClient: APIClient { get }
    var flowLayoutProvider: FlowLayoutProvideable { get }
    var pokemonService: PokemonsService { get }
    var realm: Realm { get }
}

final class DefaultApplicationDependenciesProvider: ApplicationDependenciesProvider {
    private(set) lazy var apiClient: APIClient = {
       DefaultAPIClient()
    }()

    lazy var flowLayoutProvider: FlowLayoutProvideable = {
        FlowLayoutProvider()
    }()

    lazy var pokemonService: PokemonsService = {
        APIPokemonsService(apiClient: apiClient)
    }()

    lazy var realm: Realm = {
        let config = Realm.Configuration(
            schemaVersion: 1,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 1) {
                } else {
                    
                }
        })

        Realm.Configuration.defaultConfiguration = config

        return try! Realm()
    }()
}
