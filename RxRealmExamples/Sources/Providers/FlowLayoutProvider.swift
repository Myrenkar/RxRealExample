import UIKit

protocol FlowLayoutProvideable {
    var carouselLayout: UICollectionViewFlowLayout { get }
}

final class FlowLayoutProvider: FlowLayoutProvideable {
    lazy var carouselLayout: UICollectionViewFlowLayout = {
        CarouselFlowLayout()
    }()
}
