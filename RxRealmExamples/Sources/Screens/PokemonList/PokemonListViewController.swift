import UIKit
import RxSwift
import RxCocoa
import RxRealm

final class PokemonListViewController: ViewController {

    // MARK: - Properties
    private let pokemonListView: PokemonListView
    private let viewModel: PokemonListViewModelProtocol
    private let disposeBag = DisposeBag()

    // MARK: - Initialization

    init(layoutProvider: FlowLayoutProvideable, viewModel: PokemonListViewModelProtocol) {
        self.pokemonListView = PokemonListView(layoutProvider: layoutProvider)
        self.viewModel = viewModel
        super.init()
    }

    // MARK: - Overrides

    override func loadView() {
        view = pokemonListView
    }

    override func setupProperties() {
        super.setupProperties()

        pokemonListView.collectionView.registerClass(PokemonCell.self)
    }

    override func setupNavigationItem() {
        super.setupNavigationItem()

        title = "Add pokemon to list"
        navigationItem.rightBarButtonItem = pokemonListView.addButton
    }

    override func setupBindings() {
        super.setupBindings()

        pokemonListView.addButton.rx.tap
            .subscribe(onNext: { [unowned self] _ in
                self.viewModel.fetchPokemons()
            })
            .disposed(by: disposeBag)

        viewModel.pokemons
            .bind(to: pokemonListView.collectionView.rx.items(cellIdentifier: PokemonCell.reuseIdentifier, cellType: PokemonCell.self)) { row, element, cell in
                cell.nameLabel.text = element.name.capitalized
                if let sprite = element.sprites, let frontUrlString = sprite.front, let url = URL(string: frontUrlString) {
                    cell.imageView.setImage(with: url)
                }
            }
            .disposed(by: disposeBag)
    }
}

