import UIKit

class CollectionViewCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupProperties()
        setupViewHierarchy()
        setupLayoutConstraints()
        setupReactiveBindings()
    }

    // MARK: Abstract

    /// Sets up the properties of `self`. Called automatically on `init(frame:)`.
    func setupProperties() {}

    /// Sets up self views hierarchy and subviews in `self`. Called automatically on `init(frame:)`.
    func setupViewHierarchy() {}

    /// Sets up layout in `self`. Called automatically on `init(frame:)`.
    func setupLayoutConstraints() {}

    /// Sets up bindings in `self`. Called automatically on `init(frame:)`.
    func setupReactiveBindings() {}

    @available(*, unavailable, message: "Use init(frame:) instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectionViewCell: Reusable {}
