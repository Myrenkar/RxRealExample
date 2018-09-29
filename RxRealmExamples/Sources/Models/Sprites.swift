import Foundation
import RealmSwift

final class Sprites: Object, Codable {
    @objc dynamic var front: String? = nil
    @objc dynamic var back: String? = nil

    private enum CodingKeys: String, CodingKey {
        case front = "front_default"
        case back = "back_default"
    }
}
