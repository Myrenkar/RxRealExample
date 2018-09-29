import UIKit

final class CarouselFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {

        itemSize = CGSize(width: 200.0, height: 300.0)
        minimumLineSpacing = 20.0
        minimumInteritemSpacing = 30.0
        sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        scrollDirection = .vertical
    }
}
