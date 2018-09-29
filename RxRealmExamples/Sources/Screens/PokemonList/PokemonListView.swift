import UIKit

final class PokemonListView: View {

    // MARK: Properties

    private(set) lazy var addButton: UIBarButtonItem = {
        UIBarButtonItem(barButtonSystemItem: .add
            , target: nil, action: nil)
    }()

    private(set) lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layoutProvider.carouselLayout)

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .lightGray

        return collectionView
    }()

    private let layoutProvider: FlowLayoutProvideable

    // MARK: Initialization

    init(layoutProvider: FlowLayoutProvideable) {
        self.layoutProvider = layoutProvider
        super.init()
    }

    // MARK: Overrides

    override func setupViewHierarchy() {
        super.setupViewHierarchy()

        addSubview(collectionView)
    }

    override func setupLayoutConstraints() {
        super.setupLayoutConstraints()

        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
